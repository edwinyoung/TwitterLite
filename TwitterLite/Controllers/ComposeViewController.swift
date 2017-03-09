//
//  ComposeViewController.swift
//  TwitterLite
//
//  Created by Edwin Young on 3/4/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
	
	@IBOutlet weak var userProfileImage: UIImageView!
	@IBOutlet weak var userDisplayName: UILabel!
	@IBOutlet weak var userTwitterHandle: UILabel!
	@IBOutlet weak var tweetText: UITextView!
	
	var prevViewController = ""
	var replyUserHandle = ""
	var replyTweetId = -1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		let user = User.currentUser!
		
		userDisplayName.text = user.name!
		userTwitterHandle.text = "@" + user.screenName!
		
		userProfileImage.setImageWith(user.profileImageURL!)
		
		if replyUserHandle != "" {
			tweetText.text = replyUserHandle
		} else {
			tweetText.text = ""
		}
		
		tweetText.becomeFirstResponder()
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
	@IBAction func onTweet(_ sender: UIButton) {
		TwitterClient.shared.tweet(text: tweetText.text)
		self.navigationController!.popViewController(animated: true)
	}
	
}
