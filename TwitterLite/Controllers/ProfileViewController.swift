//
//  ProfileViewController.swift
//  TwitterLite
//
//  Created by Edwin Young on 3/4/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	var user: User!
	
	@IBOutlet weak var userProfileImage: UIImageView!
	@IBOutlet weak var userBannerImage: UIImageView!
	@IBOutlet weak var userDisplayName: UILabel!
	@IBOutlet weak var userTwitterHandle: UILabel!
	@IBOutlet weak var userTweetCount: UILabel!
	@IBOutlet weak var userFollowingCount: UILabel!
	@IBOutlet weak var userFollowersCount: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		userDisplayName.text = user.name
		userTwitterHandle.text = "@" + (user.screenName)!
		userTweetCount.text = String(describing: user.tweetCount!)
		userFollowingCount.text = String(describing: user.followingCount!)
		userFollowersCount.text = String(describing: user.followersCount!)
		
		userProfileImage.setImageWith(user.profileImageURL!)
		userBannerImage.setImageWith(user.profileBannerImageURL!)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
