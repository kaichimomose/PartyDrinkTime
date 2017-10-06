//
//  File.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/05.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import UIKit

protocol AlertPresentable: class {
    func usernameAlart()
    func usericonAlart()
}

extension AlertPresentable where Self: UIViewController {
    func usernameAlart() {
        let alertVC = UIAlertController(
            title: "Error",
            message: "Please type your username",
            preferredStyle: .alert
        )
        
        alertVC.addAction(
            UIAlertAction(
                title: "Ok",
                style: .default,
                handler: { (action) in
                    
            })
        )
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func usericonAlart() {
        let alertVC = UIAlertController(
            title: "Error",
            message: "Please add your usericon",
            preferredStyle: .alert
        )
        
        alertVC.addAction(
            UIAlertAction(
                title: "Ok",
                style: .default,
                handler: { (action) in
                    
            })
        )
        
        self.present(alertVC, animated: true, completion: nil)
    }
}

