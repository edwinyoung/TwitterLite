//
//  TweetsViewController.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	var tweets: [Tweet]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 140
		
		TwitterClient.shared.homeTimeline(success: { (tweets: [Tweet]) in
			self.tweets = tweets
			self.tableView.reloadData()
		}, failure: { (error: Error) -> () in
			print(error.localizedDescription)
		})
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if tweets != nil {
			return tweets.count
		} else {
			return 0
		}
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
		
		let tweet = tweets[indexPath.row]
		
		cell.userDisplayName.text = tweet.user?.name
		cell.userTwitterHandle.text = "@" + (tweet.user?.screenName)!
		cell.tweetText.text = tweet.text
		cell.tweetTime.text = calculateTimeStamp(timeTweetPostedAgo: (tweet.timestamp?.timeIntervalSinceNow)!)
		cell.retweetCountLabel.text = String(describing: tweet.retweetCount)
		cell.favoriteCountLabel.text = String(describing: tweet.favoritesCount)
		
		cell.userProfileImage.setImageWith((tweet.user?.profileImageURL)!)
		
		return cell
	}
	
	func calculateTimeStamp(timeTweetPostedAgo: TimeInterval) -> String {
		// Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
		var rawTime = Int(timeTweetPostedAgo)
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
	}
	
	@IBAction func onLogoutButton(_ sender: UIButton) {
		TwitterClient.shared.logout()
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// TODO: Pass tweet along to TweetDetailViewController
	}
	
}
