//
//  User.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class User: NSObject {
	
	var dictionary: NSDictionary?
	var name: String?
	var screenName: String?
	var profileImageURL: URL?
	var profileBannerImageURL: URL?
	var blurb: String?
	var followersCount: Int?
	var followingCount: Int?
	var tweetCount: Int?
	
	init(dict: NSDictionary) {
		dictionary = dict
		name = dict["name"] as? String
		screenName = dict["screen_name"] as? String
		blurb = dict["description"] as? String
		followersCount = (dict["followers_count"] as? Int) ?? 0
		followingCount = (dict["friends_count"] as? Int) ?? 0
		tweetCount = (dict["statuses_count"] as? Int) ?? 0
		
		let profileImageURLString = dict["profile_image_url_https"] as? String
		if profileImageURLString != nil {
			profileImageURL = URL(string: profileImageURLString!)
		}
		
		let profileBannerImageURLString = dict["profile_background_image_url_https"] as? String
		if profileBannerImageURLString != nil {
			profileBannerImageURL = URL(string: profileBannerImageURLString!)
		}
	}
	
	static let userDidLogoutNotification = "UserDidLogout"
	static var _currentUser: User?
	
	class var currentUser: User? {
		get {
			if _currentUser == nil {
				
				let defaults = UserDefaults.standard
				if let userData = defaults.object(forKey: "currentUserData") as? NSData {
					let dictionary = try! JSONSerialization.jsonObject(with: userData as Data, options: [])
					_currentUser = User(dict: dictionary as! NSDictionary)
				}
			}
			
			return _currentUser
		}
		set(user) {
			_currentUser = user
			let defaults = UserDefaults.standard
			
			if let user = user {
				let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
				defaults.set(data, forKey: "currentUserData")
			} else {
				defaults.removeObject(forKey: "currentUserData")
			}
			
			defaults.synchronize()
		}
	}
}
