//
//  TweetCell.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
	var tweet: Tweet!
	
	@IBOutlet weak var userProfileImage: UIImageView!
	@IBOutlet weak var userDisplayName: UILabel!
	@IBOutlet weak var userTwitterHandle: UILabel!
	@IBOutlet weak var tweetTime: UILabel!
	@IBOutlet weak var tweetText: UILabel!
	
	@IBOutlet weak var retweetCountLabel: UILabel!
	@IBOutlet weak var favoriteCountLabel: UILabel!
	
	@IBOutlet weak var retweetButton: UIButton!
	@IBOutlet weak var favoriteButton: UIButton!
	
	var retweeted = false
	var favorited = false
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		
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
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	@IBAction func onRetweet(_ sender: UIButton) {
		if retweeted == false {
			retweetButton.setImage(UIImage(named: "retweet-active"), for: UIControlState.normal)
			retweetCountLabel.text = "\(Int(retweetCountLabel.text!)! + 1)"
			TwitterClient.shared.retweet(id: tweet.id)
			retweeted = true
		} else {
			retweetButton.setImage(UIImage(named: "retweet"), for: UIControlState.normal)
			retweetCountLabel.text = "\(Int(retweetCountLabel.text!)! - 1)"
			retweeted = false
		}
	}
	
	@IBAction func onFavorite(_ sender: UIButton) {
		if favorited == false {
			favoriteButton.setImage(UIImage(named: "favorite-active"), for: UIControlState.normal)
			favoriteCountLabel.text = "\(Int(favoriteCountLabel.text!)! + 1)"
			TwitterClient.shared.favorite(id: tweet.id)
			favorited = true
		} else {
			favoriteButton.setImage(UIImage(named: "favorite"), for: UIControlState.normal)
			favoriteCountLabel.text = "\(Int(favoriteCountLabel.text!)! - 1)"
			TwitterClient.shared.unfavorite(id: tweet.id)
			favorited = false
		}
	}
	
	
}
