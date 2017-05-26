//
//  Constants.swift
//  NatureNet
//
//  Created by Mahzoon, Mohammad Javad on 5/16/17.
//  Copyright © 2017 NatureNet. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//
// Colors
//

// the green color
let APP_COLOR_LIGHT = UIColor(red: 31.0/255.0, green: 205.0/255.0, blue: 108.0/255.0, alpha: 1.0)
// the navy color
let APP_COLOR_DARK = UIColor(red: 53.0/255.0, green: 74.0/255.0, blue: 95.0/255.0, alpha: 1.0)
// the shadow color
let APP_COLOR_SHADOW = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0)
// pin colors
let PIN_COLORS: [String: UIColor] = ["aces": UIColor.blue, "rcnc": UIColor.green, "aws": UIColor.red, "zz_elsewhere": UIColor.cyan]
// default pin color
let DEFAULT_PIN_COLOR = UIColor.darkGray

//
// Icons names
//
let JOIN_PROFILE_IMAGE = "join screen - user"
let ADD_OBSV_IMAGE = "icon - observation default"
// Icons used in code
let ICON_PROFILE_ONLINE = UIImage(named: "icon - profile - online")
let ICON_PROFILE_OFFLINE = UIImage(named: "icon - profile - offline")
let ICON_DESIGN_IDEA_STATUS_DONE = UIImage(named: "icon - done")
let ICON_DESIGN_IDEA_STATUS_DISCUSSING = UIImage(named: "icon - discussing")
let ICON_DEFAULT_USER_AVATAR = UIImage(named: "join screen - user")
let ICON_DEFAULT_PROJECT = UIImage(named: "icon - project - default")
let IMAGE_DEFAULT_OBSERVATION = UIImage(named: "image - observation - default")
let ICON_LIKE_GRAY = UIImage(named: "icon - like - gray")
let ICON_LIKE_GREEN = UIImage(named: "icon - like")
let ICON_DISLIKE_GRAY = UIImage(named: "icon - dislike - gray")
let ICON_DISLIKE_GREEN = UIImage(named: "icon - dislike")

//
// Sizes
//
let COMMENT_CELL_ESTIMATED_HEIGHT = 35.0
let RECENT_OBSV_ESTIMATED_HEIGHT = 250.0
let DESIGN_IDEA_CELL_ITEM_HEIGHT = 180.0
let PROJECT_CELL_ITEM_HEIGHT = 50.0
let GALLERY_CELL_ITEM_HEIGHT = 300.0
let COMMUNITY_CELL_ITEM_HEIGHT = 50.0
let SHOW_MORE_CELL_HEIGHT = 50.0
let COMMENT_TEXTBOX_MAX_HEIGHT = 150
let MAP_CENTER_REGION_RADIUS: CLLocationDistance = 10000 // in meters, which is 10Km
//
let COMMUNITY_LIST_INIT_COUNT = 15
let COMMUNITY_LIST_LOAD_MORE_COUNT = 15
//
let PROJECTS_LIST_INIT_COUNT = 3
let PROJECTS_LIST_LOAD_MORE_COUNT = 3
//
let DESIGN_IDEA_LIST_INIT_COUNT = 10
let DESIGN_IDEA_LIST_LOAD_MORE_COUNT = 10
//
let GALLERY_LIST_INIT_COUNT = 5
let GALLERY_LIST_LOAD_MORE_COUNT = 5
//
let DETAILED_OBSV_LIST_INIT_COUNT = 5
let DETAILED_OBSV_LIST_LOAD_MORE_COUNT = 5
//
let COMMENT_LIST_INIT_COUNT = 5
let COMMENT_LIST_LOAD_MORE_COUNT = 5


//
// Texts
//
let COMMENT_TEXTBOX_PLACEHOLDER = "Comment"
let PICKER_NO_SELECTION = "Select one"
let LISTS_SHOW_MORE_TEXT = "Show more..."
let NO_COMMENTS_TEXT = "No comments."

//
// Messages
//

// General
let AUTHENTICATION_REQUIRED_TITLE = "You need to be signed in."
let AUTHENTICATION_REQUIRED_MESSAGE = "Do you want to sign in now?"
let AUTHENTICATION_REQUIRED_BUTTON_SIGNIN_TEXT = "Yes, Sign me in"
let AUTHENTICATION_REQUIRED_BUTTON_CANCEL_TEXT = "No, not now."
let COMMENT_EMPTY_ERROR_TITLE = "Empty text?!"
let COMMENT_EMPTY_ERROR_MESSAGE = "You did not enter any text for the comment. Please first write your comment then tap send."
let COMMENT_EMPTY_ERROR_BUTTON_TEXT = "OK"
let DESIGNIDEA_EMPTY_ERROR_TITLE = "Empty text?!"
let DESIGNIDEA_EMPTY_ERROR_MESSAGE = "You did not enter any text for the design idea. Please first write your idea then tap submit."
let DESIGNIDEA_EMPTY_ERROR_BUTTON_TEXT = "OK"
let OBSERVATION_NO_IMAGE_ERROR_TITLE = "No image?!"
let OBSERVATION_NO_IMAGE_ERROR_MESSAGE = "You did not select any image for the observation. To select an image, tap on the image placeholder, then choose an observation image from your library or take a picture, then tap submit."
let OBSERVATION_NO_IMAGE_ERROR_BUTTON_TEXT = "OK"
let OBSERVATION_NO_PROJECT_ERROR_TITLE = "No project?!"
let OBSERVATION_NO_PROJECT_ERROR_MESSAGE = "You did not select any project for your observation. Please select your project, then tap submit."
let OBSERVATION_NO_PROJECT_ERROR_BUTTON_TEXT = "OK"

// Sign in Screen
let SIGN_IN_ERRORS_TITLE = "Sign in"
let SIGN_IN_ERRORS_BUTTON_TEXT = "OK"
let SIGN_IN_NO_EMAIL_PROVIDED = "Please enter your email."
let SIGN_IN_NO_PASSWORD_PROVIDED = "Please enter your password."

// Profile Screen
let PROFILE_ERRORS_TITLE = "Sign Out"
let PROFILE_ERRORS_BUTTON_TEXT = "OK"

// Join Screen
let JOIN_PROFILE_IMAGE_OPTIONS_TITLE = "Choose an Option: "
let JOIN_PROFILE_IMAGE_OPTIONS_MSG: String? = nil
let JOIN_PROFILE_IMAGE_OPTIONS_CANCEL = "Cancel"
let JOIN_PROFILE_IMAGE_OPTIONS_PICK_EXISTING = "Pick an existing from photo library"
let JOIN_PROFILE_IMAGE_OPTIONS_TAKE_NEW = "Take a new one"
let JOIN_PROFILE_IMAGE_OPTIONS_REMOVE_CURRENT = "Remove current photo"
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_LIB_TITLE = "Error accessing photo library"
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_LIB_MSG = "Can not have access to your photo library. Maybe the privacy settings will not let the app use your photo library."
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_LIB_BTN_TXT = "OK"
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_CAM_TITLE = "Error accessing camera"
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_CAM_MSG = "Can not have access to your camera. Maybe the privacy settings will not let the app use your camera."
let JOIN_PROFILE_IMAGE_OPTIONS_ERR_CAM_BTN_TXT = "OK"
let JOIN_SUCCESS_TITLE = "Welcome!"
let JOIN_SUCCESS_MESSAGE = "You are now a NatureNet community member."
let JOIN_SUCCESS_BUTTON_TEXT = "OK"
let JOIN_ERRORS_TITLE = "Join"
let JOIN_ERRORS_BUTTON_TEXT = "OK"
let JOIN_ERROR_VALIDATION_TITLE = "Join"
let JOIN_ERROR_VALIDATION_MESSAGE = "Please make sure you filled email, password, display name, fullname, and selected an affiliation."
let JOIN_ERROR_VALIDATION_BUTTON_TEXT = "OK"

// Add Observation Screen
let ADD_OBSV_IMAGE_OPTIONS_TITLE = "Choose an Option: "
let ADD_OBSV_IMAGE_OPTIONS_MSG: String? = nil
let ADD_OBSV_IMAGE_OPTIONS_CANCEL = "Cancel"
let ADD_OBSV_IMAGE_OPTIONS_PICK_EXISTING = "Pick an existing from photo library"
let ADD_OBSV_IMAGE_OPTIONS_TAKE_NEW = "Take a new one"
let ADD_OBSV_IMAGE_OPTIONS_REMOVE_CURRENT = "Remove current photo"
let ADD_OBSV_IMAGE_OPTIONS_ERR_LIB_TITLE = "Error accessing photo library"
let ADD_OBSV_IMAGE_OPTIONS_ERR_LIB_MSG = "Can not have access to your photo library. Maybe the privacy settings will not let the app use your photo library."
let ADD_OBSV_IMAGE_OPTIONS_ERR_LIB_BTN_TXT = "OK"
let ADD_OBSV_IMAGE_OPTIONS_ERR_CAM_TITLE = "Error accessing camera"
let ADD_OBSV_IMAGE_OPTIONS_ERR_CAM_MSG = "Can not have access to your camera. Maybe the privacy settings will not let the app use your camera."
let ADD_OBSV_IMAGE_OPTIONS_ERR_CAM_BTN_TXT = "OK"
let ADD_OBSV_SUCCESS_TITLE = "Thank you!"
let ADD_OBSV_SUCCESS_MESSAGE = "We appreciate your contribution to the NatureNet community project."
let ADD_OBSV_SUCCESS_BUTTON_TEXT = "Dismiss"
let ADD_OBSV_UPLOAD_FAILED_TITLE = "Upload failed."
let ADD_OBSV_UPLOAD_FAILED_MESSAGE = "You can tap submit again to try one more time. If you do not have internet connection, you can submit this observation again. Note that if you just took the observation image using the camera, the image is saved to your photo library. You could submit your observation later and choose the image from your photo library. Also, here is the error description: "
let ADD_OBSV_UPLOAD_FAILED_BUTTON_TEXT = "Dismiss"

// Observation Detail Screen
let SAVE_OBSV_ALERT_TITLE:String = "How do you want to save this observation?"
let SAVE_OBSV_ALERT_MESSAGE: String? = nil
let SAVE_OBSV_ALERT_OPTION_SAVE_PHOTO = "Save the image to my photo library"
let SAVE_OBSV_ALERT_OPTION_SHARE = "Share the content in another app"
let SAVE_OBSV_ALERT_OPTION_CANCEL = "Cancel"
let SAVE_OBSV_ERROR_MESSAGE = "Could not save the observation: "
let SAVE_OBSV_ERROR_BUTTON_TEXT = "OK"
let SAVE_OBSV_SUCCESS_TITLE = "Saved!"
let SAVE_OBSV_SUCCESS_MESSAGE = "The observation has been saved successfuly."
let SAVE_OBSV_SUCCESS_BUTTON_TEXT = "OK"

// Add design idea screen
let ADD_IDEA_SUCCESS_TITLE = "Thank you!"
let ADD_IDEA_SUCCESS_MESSAGE = "We appreciate your contribution to the NatureNet community project. You will receive an email notification once a community member responds to your idea. We also encourage you to visit our issue tracking github page at github.com/naturenet and participate in the discussions or even involve in the software development."
let ADD_IDEA_SUCCESS_BUTTON_TEXT = "Dismiss"

//
// Segue names
//
let SEGUE_SIGNIN = "SignIn"
let SEGUE_EXPLORE = "Explore"
let SEGUE_PROFILE = "Profile"
let SEGUE_DETAILS = "Details"

//
// Cell Identifiers
//
let PROJECT_CELL_ID = "ProjectCell"
let COMMUNITY_CELL_ID = "CommunityCell"
let DESIGN_IDEAS_CELL_ID = "DesignIdeasCell"
let GALLERY_CELL_ID = "GalleryCell"
let SHOW_MORE_CELL_ID = "ShowMoreCell"
let COMMENT_CELL_ID = "CommentCell"
let EXPLORE_ANNOTATION_ID = "ExploreAnnotation"

//
// Database reference names
//
let DB_SITES_PATH = "sites"
let DB_PROJECTS_PATH = "activities"
let DB_USERS_PATH = "users"
let DB_USERS_PRIVATE_PATH = "users-private"
let DB_OBSERVATIONS_PATH = "observations"
let DB_DESIGNIDEAS_PATH = "ideas"
let DB_COMMENTS_PATH = "comments"
let DB_LIKES_PATH = "likes"
let DB_SOURCE = "ios"
let DB_LATEST_CONTRIBUTION = "latest_contribution"

//
// Cloudinary
//
let CLOUDINARY_CLOUD_NAME = "university-of-colorado"
let CLOUDINARY_PRESET = "ios-preset"

//
// Other constants
//
let DESIGN_IDEA_STATUS_DISCUSSING = "doing"
let DESIGN_IDEA_STATUS_TO_DO = "to do"
let DESIGN_IDEA_STATUS_DONE = "done"
let DESIGN_IDEA_TYPE = ""
let DESIGN_IDEA_GROUP = "idea"



