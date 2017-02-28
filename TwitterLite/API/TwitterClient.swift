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

	func currentAccount() {
		get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: {
			(task: URLSessionDataTask, response: Any?) in
			let userDictionary = response as! NSDictionary
			let user = User(dict: userDictionary)
			
			print("User: \(user.name)")
			print(user.screenName!)
			print(user.profileImageURL?.description)
			print(user.blurb!)
			
		}, failure: {
			(task: URLSessionDataTask?, error: Error) in
			print(error.localizedDescription)
		})
	}
	
	func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
		get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: {
			(task: URLSessionDataTask, response: Any?) in
			let tweetDicts = response as! [NSDictionary]
			
			let tweets = Tweet.tweetsWithArray(dicts: tweetDicts)
			success(tweets)
		}, failure: {
			(task: URLSessionDataTask?, error: Error) in
			failure(error)
		})
	}
}
