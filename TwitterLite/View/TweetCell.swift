//
//  TweetCell.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/27/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
	
	@IBOutlet weak var userProfileImage: UIImageView!
	@IBOutlet weak var userDisplayName: UILabel!
	@IBOutlet weak var userTwitterHandle: UILabel!
	@IBOutlet weak var tweetTime: UILabel!
	@IBOutlet weak var tweetText: UILabel!
	
	@IBOutlet weak var replyCountLabel: UILabel!
	@IBOutlet weak var retweetCountLabel: UILabel!
	@IBOutlet weak var favoriteCountLabel: UILabel!
	
	@IBOutlet weak var replyImage: UIImageView!
	@IBOutlet weak var retweetImage: UIImageView!
	@IBOutlet weak var favoriteImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
