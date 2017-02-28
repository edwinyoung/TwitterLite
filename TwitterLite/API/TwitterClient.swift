//
//  TwitterClient.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
	
	static let shared = TwitterClient(baseURL: URL(string: "https://api.twitter.com"), consumerKey: "x6DYcyPqb6xWLP6ARKZAciCN2", consumerSecret: "HgIt0Fa9tnouwcPWTQ4mhdwnFIwK8Pkkc756XXnhupLQEf9DEY")!
	
}
