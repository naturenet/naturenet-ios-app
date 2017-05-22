//
//  DataService.swift
//  NatureNet
//
//  Created by Mohammad Javad Mahzoon on 5/20/17.
//  Copyright © 2017 NatureNet. All rights reserved.
//

import Foundation
import Firebase

// This class is a singleton, meaning only one instance is going to be created from this class. That only instance is DataService.ds
// So, to use this class call its function by referencing the only instance, like this: DataService.ds.SignOut()
class DataService  {
    
    // This is the only instance of this singleton class
    static let ds = DataService()
    
    // reference to the Firebase "real-time database"
    private var db_ref: DatabaseReference!
    
    // The current user is either nil which means nobody is logged-in in the device, or it has a value indicating some user is logged in. This is a private member and is referenced only in the class functions for example in the LoggedIn() function.
    private var currentUser: User?
    
    // The sites array contains (siteId, siteName) sorted in an array. It will be initialized in the init, and the function "GetSites" returns it.
    private var sites = Array<(key : String, value : String)>()
    
    // reference to the observer handle of sites. This observer looks for changes in sites, and updates the "sites" array if new site is being added, or changed. The reference is mainly for "dispose" to remove the handle.
    private var sitesHandle: UInt!
    
    // The projects stored by their site. This dictionary is like: {siteName -> [NNProject1, NNProject2, ...]}. Note that we might have projects duplicated in multiple sites.
    private var projects = [String: [NNProject]]()
    // reference to the observer handle of projects. This observer looks for changes in projects, and updates the "projects" array if new project is being added, or changed. The reference is mainly for "dispose" to remove the handle.
    private var projectsHandle: UInt!
    
    // The users stored by their affiliation. This dictionary is like: {siteName -> [NNUser1, NNUser2, ...]}.
    private var users = [String: [NNUser]]()
    // reference to the observer handle of users. This observer looks for changes in users, and updates the "users" array if new user is being added, or changed. The reference is mainly for "dispose" to remove the handle.
    private var usersHandle: UInt!
    
    
    init() {
        // initializing the reference to the database
        db_ref = Database.database().reference()
        
        // adding observer to the sites
        sitesHandle = db_ref.child(DB_SITES_PATH).observe(.value, with: { (snapshot) in
            // snapshot will be the whole "sites" key with its children to the leaf. For example, if site/aces/description value changes, added, or removed, the whole sites/ will be returned. So, we can replace the "sites" array with site names in the snapshot.
            if let sitesSnapshot = snapshot.value as? [String:[String:AnyObject]] {
                // the sitesSnapshot is like "siteId" -> { "key" -> <object> } (the "key" that we are interested in is "name")
                var sitesDict = [String:String]()
                for (siteId, v) in sitesSnapshot {
                    if let siteName = v["name"] as? String {
                        sitesDict[siteId] = siteName
                    }
                }
                self.sites = sitesDict.sorted(by: {$0.key < $1.key})
            }
        })
        
        // adding observer to the projects (activities)
        projectsHandle = db_ref.child(DB_PROJECTS_PATH).observe(.value, with: { (snapshot) in
            // snapshot will contain the whole "activities" key with its children to the leaf.
            if let activitiesDict = snapshot.value as? [String:[String:AnyObject]] {
                // the activitiesDict looks like: {"activityId":{key:val,key:val,...}}
                for (_, projectSnapshot) in activitiesDict {
                    // create a project based on the snapshot
                    let project = NNProject.createProjectFromFirebase(with: projectSnapshot)
                    // add the project to the "projects" dictionary
                    for siteId in project.sites {
                        if (self.projects[siteId] != nil) {
                            self.projects[siteId]!.append(project)
                        } else {
                            self.projects[siteId] = [NNProject]()
                            self.projects[siteId]!.append(project)
                        }
                    }
                }
            }
            // excluding projects having no site (these are probably test projects)
            self.projects.removeValue(forKey: "")
            // sort the projects by project name
            for (k, v) in self.projects {
                self.projects[k] = v.sorted(by: { $0.name < $1.name })
            }
        })
        
        // adding observer to the users
        usersHandle = db_ref.child(DB_USERS_PATH).observe(.value, with: { (snapshot) in
            // snapshot will contain the whole "users" key with its children to the leaf.
            if let usersDict = snapshot.value as? [String:[String:AnyObject]] {
                // the usersDict looks like: {"userId":{key:val,key:val,...}}
                for (_, userSnapshot) in usersDict {
                    // create a user based on the snapshot
                    let user = NNUser.createUserFromFirebase(with: userSnapshot)
                    // add the user to the "users" dictionary
                    if (self.users[user.affiliation] != nil) {
                        self.users[user.affiliation]!.append(user)
                    } else {
                        self.users[user.affiliation] = [NNUser]()
                        self.users[user.affiliation]!.append(user)
                    }
                }
            }
            // excluding users having no site (these are probably test users)
            self.users.removeValue(forKey: "")
            // sort the users by user display name
            for (k, v) in self.users {
                self.users[k] = v.sorted(by: { $0.displayName < $1.displayName })
            }
        })
    }
    
    func dispose() {
        // disposing all data objects
        sites.removeAll()
        projects.removeAll()
        users.removeAll()
        currentUser = nil
        // remove site observer
        db_ref.removeObserver(withHandle: sitesHandle)
        // remove projects observer
        db_ref.removeObserver(withHandle: projectsHandle)
        // remove users observer
        db_ref.removeObserver(withHandle: usersHandle)
    }
    
    // To authenticate a user using email/password use this function. Upon success, the function calls the "completion" callback parameter with "true" and empty string parameters. If there is any error in signing in, then the parameters of "completion" callback would be false (indicating that the sign in process was not successful) and error string. The error string is generated by Firebase, and is hopefully desciptive enough about the error.
    func Authenticate(email: String, pass: String,
                             completion: @escaping (Bool, String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            self.currentUser = user
            if let e = error {
                // the localized description contains error's description
                completion(false, e.localizedDescription)
            } else {
                completion(true, "")
            }
        }
    }
    
    // To check if anybody is logged-in in this device, call this. It returns true if somebody is logged in and false otherwise.
    func LoggedIn() -> Bool {
        if currentUser == nil {
            // if currentUser is nil, we need to check Firebase auth again. Maybe we lost the user, but the user is still logged in. A typical scenario which supports this case is that the user logged-in but closes the app. The user is still logged in but the app looses the pointer to the currentUser.
            if Auth.auth().currentUser == nil {
                return false
            } else {
                // update our pointer to the current user
                self.currentUser = Auth.auth().currentUser
                return true
            }
        }
        return true
    }
    
    // To signout user from Firebase, call this function. SignOut returns a tuple containing result status as a boolean and error if any as a string. In case of successful signout, the return value will be (true, ""). But, in case of error the return value will be (false, <error description>).
    func SignOut() -> (Bool, String){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            return (false, signOutError.localizedDescription)
        }
        currentUser = nil
        return (true, "")
    }
    
    // returns the number of sites.
    func GetNumSites() -> Int {
        return sites.count
    }
    // returning only site names sorted by their Ids
    func GetSiteNames() -> [String] {
        return self.sites.map{(k, v) -> String in return v}
    }
    
    func GetProjects() -> [String:[NNProject]] {
        return self.projects
    }
    
    // returns number of projects in the site index.
    func GetNumProjects(in siteIndex: Int, searchFilter: String) -> Int {
        if searchFilter != "" {
            return self.projects[self.sites[siteIndex].key]?.filter({ (e: NNProject) -> Bool in
                return (e.name.range(of: searchFilter) != nil)
            }).count ?? 0
        } else {
            return self.projects[self.sites[siteIndex].key]?.count ?? 0
        }
    }
    
    // returns a specific project which is located at siteIndex and has index="position" in the array.
    func GetProject(in siteIndex:Int, at position: Int, searchFilter: String) -> NNProject? {
        if searchFilter != "" {
            if let ps = self.projects[self.sites[siteIndex].key]?.filter({ (e: NNProject) -> Bool in
                return (e.name.lowercased().range(of: searchFilter.lowercased()) != nil)}) {
                if position < ps.count {
                    return ps[position]
                }
            }
        } else {
            if let ps = self.projects[self.sites[siteIndex].key] {
                if position < ps.count {
                    return ps[position]
                }
            }
        }
        return nil
    }
    
    // returns projects in a site filtered by a filter string. The filter is on the project name. Also this function gets the "page" argument which determines number of returned projects. The number of returned project = (page * PROJECTS_LIST_LOAD_MORE_COUNT) + PROJECTS_LIST_INIT_COUNT. If the number is more than the size of the possible contents, then the whole content is returned.
//    func GetProjects(site: String, filter: String, page: Int) -> [NNProject] {
//        var ret_val = [NNProject]()
//        if let p = self.projects[site] {
//            let a = p.filter({ (e: NNProject) -> Bool in
//                return (e.name.range(of: filter) != nil)
//            }).prefix(PROJECTS_LIST_INIT_COUNT + PROJECTS_LIST_LOAD_MORE_COUNT * page)
//            ret_val.append(contentsOf: a)
//        }
//        return ret_val
//    }
    
}
