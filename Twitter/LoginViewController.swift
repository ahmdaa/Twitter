//
//  LoginViewController.swift
//  Twitter
//
//  Created by Ahmed Abdalla on 2/14/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.setValue(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not log in!")
        })
    }

}
