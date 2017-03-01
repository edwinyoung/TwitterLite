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
		TwitterClient.shared.homeTimeline(success: { (tweets: [Tweet]) in
			self.tweets = tweets
		}, failure: { (error: Error) -> () in
			print(error.localizedDescription)
		})
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 110
		
		tableView.reloadData()
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
		
		
		return cell
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
	
}
