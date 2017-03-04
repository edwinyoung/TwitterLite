//
//  Tweet.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class Tweet: NSObject {
	var text: String?
	var timestamp: Date?
	var retweetCount: Int = 0
	var favoritesCount: Int = 0
	var user: User?
	var id: Int?
	var favorited: Bool?
	var retweeted: Bool?
	
	init(dict: NSDictionary) {
		text = dict["text"] as? String
		retweetCount = (dict["retweet_count"] as? Int) ?? 0
		favoritesCount = (dict["favourites_count"] as? Int) ?? 0
		
		id = (dict["id"] as? Int) ?? nil
		favorited = (dict["favorited"] as? Bool) ?? false
		retweeted = (dict["retweeted"] as? Bool) ?? false
		
		let userDict = dict["user"] as? NSDictionary
		user = User(dict: userDict!)
		
		if let timestampString = dict["created_at"] as? String {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
			timestamp = dateFormatter.date(from: timestampString)
		}
	}
	
	var timestampString: String? {
		get {
			if self.timestamp != nil {
				let timeInterval = timestamp?.timeIntervalSinceNow
				
				// Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
				var rawTime = Int(timeInterval!)
				var timeAgo: Int = 0
				var timeChar = ""
				
				rawTime = rawTime * (-1)
				
				// Figure out time ago
				if (rawTime <= 60) { // SECONDS
					timeAgo = rawTime
					timeChar = "s"
				} else if ((rawTime/60) <= 60) { // MINUTES
					timeAgo = rawTime/60
					timeChar = "m"
				} else if (rawTime/60/60 <= 24) { // HOURS
					timeAgo = rawTime/60/60
					timeChar = "h"
				} else if (rawTime/60/60/24 <= 365) { // DAYS
					timeAgo = rawTime/60/60/24
					timeChar = "d"
				} else if (rawTime/(3153600) <= 1) { // YEARS
					timeAgo = rawTime/60/60/24/365
					timeChar = "y"
				}
				
				return "\(timeAgo)\(timeChar)"
				
			} else {
				return ""
			}
		}
	}
	
	class func tweetsWithArray(dicts: [NSDictionary]) -> [Tweet] {
		var tweets = [Tweet]()
		for dict in dicts {
			let tweet = Tweet(dict: dict)
			
			tweets.append(tweet)
		}
		return tweets
	}
}
