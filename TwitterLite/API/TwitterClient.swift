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
	
	var loginSuccess: (() -> ())?
	var loginFailure: ((Error) -> ())?
	
	func login(success: @escaping () -> (), failure: @escaping (Error) -> ()) {
		loginSuccess = success
		loginFailure = failure
		deauthorize()
		fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterlite://oauth"), scope: nil, success: {
			(requestToken: BDBOAuth1Credential?) -> Void in
			
			let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")!
			UIApplication.shared.openURL(url)
			success()
		}, failure: {(error: Error?) -> Void in
			print("Twitter.login: \(error!.localizedDescription)")
			self.loginFailure?(error!)
			print(Thread.callStackSymbols)
		})
	}
	
	func logout() {
		User.currentUser = nil
		deauthorize()
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userDidLogoutNotification), object: nil)
	}
	
	func retweet(id: Int?) {
		if id != nil {
			post("1.1/statuses/retweet/\(id!).json", parameters: nil, progress: nil, success: {
				(task: URLSessionDataTask, response: Any?) in
				
			}, failure: {
				(task: URLSessionDataTask?, error: Error) in
				print("Tweet ID: \(id!)")
				print(error.localizedDescription)
				print(Thread.callStackSymbols)
			})
		}
	}
	
	func handleOpenUrl(url: URL) {
		let requestToken = BDBOAuth1Credential(queryString: url.query!)
		fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential?) in
			
			self.currentAccount(success: { (user: User) in
				User.currentUser = user
				self.loginSuccess?()
			}, failure: { (error: NSError) in
				self.loginFailure?(error)
				print(Thread.callStackSymbols)
			})
			
			self.loginSuccess?()
			
		}, failure: { (error: Error?) in
			print(error!.localizedDescription)
			self.loginFailure?(error!)
			print(Thread.callStackSymbols)
		})
	}

	func currentAccount(success: @escaping (User) -> (), failure: @escaping (NSError) -> ()) {
		get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: {
			(task: URLSessionDataTask, response: Any?) in
			let userDictionary = response as! NSDictionary
			let user = User(dict: userDictionary)
			
			success(user)
			
		}, failure: {
			(task: URLSessionDataTask?, error: Error) in
			failure(error as NSError)
			print(Thread.callStackSymbols)
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
			print(Thread.callStackSymbols)
		})
	}
}
