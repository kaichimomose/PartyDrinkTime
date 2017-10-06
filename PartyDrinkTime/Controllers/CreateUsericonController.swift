//
//  CreateUsericonController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/25.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Kingfisher

class CreateUsericonController: UIViewController, AlertPresentable {

    @IBOutlet weak var usericonImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    let photoHelper = MGPhotoHelper()
    var profileImage = [ProfileImage?]()
    var selectImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usericonImageView.layer.cornerRadius = 6
        usericonImageView.layer.borderColor = UIColor.lightGray.cgColor
        usericonImageView.layer.borderWidth = 1
    }
    
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        photoHelper.presentActionSheet(from: self)
        photoHelper.completionHandler = { image in
            ProfileImageService.create(for: image)
        self.selectImage += 1
        }
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        if self.selectImage == 0 {
            self.usericonAlart()
            return
        }
        
        else {
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
