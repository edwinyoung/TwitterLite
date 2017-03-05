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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
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
