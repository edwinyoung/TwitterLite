//
//  User.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class User: NSObject {
	var name: String?
	var screenName: String?
	var profileImageURL: URL?
	var blurb: String?
	
	init(dict: NSDictionary) {
		name = dict["name"] as? String
		screenName = dict["screen_name"] as? String
		blurb = dict["description"] as? String
		let profileImageURLString = dict["profile_image_url_https"] as? String
		if profileImageURLString != nil {
			profileImageURL = URL(string: profileImageURLString!)
		}
		
	}
}
