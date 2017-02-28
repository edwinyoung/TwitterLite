//
//  LoginViewController.swift
//  TwitterLite
//
//  Created by Edwin Young on 2/20/17.
//  Copyright © 2017 Test Org Pls Ignore. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

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
	@IBAction func onLoginButton(_ sender: UIButton) {
		let client = TwitterClient.shared
		
		client.login(success: { () -> () in
			print("I've logged in!")
			
			self.performSegue(withIdentifier: "loginSegue", sender: nil)
		}, failure: {(error: Error) in
			print("Error: \(error.localizedDescription)")
		})
	}

}
