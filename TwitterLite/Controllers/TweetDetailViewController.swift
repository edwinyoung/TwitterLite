//
//  TweetDetailViewController.swift
//  TwitterLite
//
//  Created by Edwin Young on 3/4/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
	
	var tweet: Tweet!
	
	@IBOutlet weak var userProfileImage: UIImageView!
	@IBOutlet weak var userDisplayName: UILabel!
	@IBOutlet weak var userTwitterHandle: UILabel!
	@IBOutlet weak var tweetTime: UILabel!
	@IBOutlet weak var tweetText: UILabel!
	@IBOutlet weak var replyButton: UIButton!
	@IBOutlet weak var retweetButton: UIButton!
	@IBOutlet weak var favoriteButton: UIButton!
	
	@IBOutlet weak var retweetCount: UILabel!
	@IBOutlet weak var favoriteCount: UILabel!
	
	var retweeted = false
	var favorited = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		userDisplayName.text = tweet.user?.name
		userTwitterHandle.text = "@" + (tweet.user?.screenName)!
		tweetText.text = tweet.text
		tweetTime.text = tweet.timestampString
		retweetCount.text = String(describing: tweet.retweetCount)
		favoriteCount.text = String(describing: tweet.favoritesCount)
		
		favorited = tweet.favorited!
		retweeted = tweet.retweeted!
		
		if retweeted == true {
			retweetButton.setImage(UIImage(named: "retweet-active"), for: UIControlState.normal)
		} else {
			retweetButton.setImage(UIImage(named: "retweet"), for: UIControlState.normal)
		}
		
		if favorited == true {
			favoriteButton.setImage(UIImage(named: "favorite-active"), for: UIControlState.normal)
		} else {
			favoriteButton.setImage(UIImage(named: "favorite"), for: UIControlState.normal)
		}
		
		userProfileImage.setImageWith((tweet.user?.profileImageURL)!)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func onRetweet(_ sender: UIButton) {
		if retweeted == false {
			retweetButton.setImage(UIImage(named: "retweet-active"), for: UIControlState.normal)
			retweetCount.text = "\(Int(retweetCount.text!)! + 1)"
			TwitterClient.shared.retweet(id: tweet.id)
			retweeted = true
		} else {
			retweetButton.setImage(UIImage(named: "retweet"), for: UIControlState.normal)
			retweetCount.text = "\(Int(retweetCount.text!)! - 1)"
			retweeted = false
		}
	}
	
	@IBAction func onFavorite(_ sender: UIButton) {
		if favorited == false {
			favoriteButton.setImage(UIImage(named: "favorite-active"), for: UIControlState.normal)
			favoriteCount.text = "\(Int(favoriteCount.text!)! + 1)"
			TwitterClient.shared.favorite(id: tweet.id)
			favorited = true
		} else {
			favoriteButton.setImage(UIImage(named: "favorite"), for: UIControlState.normal)
			favoriteCount.text = "\(Int(favoriteCount.text!)! - 1)"
			TwitterClient.shared.unfavorite(id: tweet.id)
			favorited = false
		}
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
		
		let backButton = UIBarButtonItem()
		backButton.title = "Cancel"
		navigationItem.backBarButtonItem = backButton
		
		if segue.identifier == "ReplySegue" {
			let composeViewController = segue.destination as! ComposeViewController
			
		} else if segue.identifier == "ComposeTweetSegue" {
			
		}
	}
	
	
}
