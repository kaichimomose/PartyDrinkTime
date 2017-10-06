//
//  CreateUsernameViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController, AlertPresentable {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 6
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { usernameAlart(); return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
        User.setCurrent(user, writeToUserDefaults: true)

        }
    }
        
}
