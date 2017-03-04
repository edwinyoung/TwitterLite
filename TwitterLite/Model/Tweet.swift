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
	
	class func tweetsWithArray(dicts: [NSDictionary]) -> [Tweet] {
		var tweets = [Tweet]()
		for dict in dicts {
			let tweet = Tweet(dict: dict)
			
			tweets.append(tweet)
		}
		return tweets
	}
}
