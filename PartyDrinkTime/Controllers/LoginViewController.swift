//
//  LoginViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/14.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("follow button tapped")
    }
}
