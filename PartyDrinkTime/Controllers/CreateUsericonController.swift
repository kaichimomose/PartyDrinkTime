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

class CreateUsericonController: UIViewController {

    @IBOutlet weak var usericonImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    let photoHelper = MGPhotoHelper()
    var profileImage = [ProfileImage]()
    
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
        }
        
//        UserService.profileImage(for: User.current) { (profileImage) in
//            self.profileImage = profileImage
//            let imageURL = URL(string: self.profileImage[0].imageURL)
//            self.usericonImageView.kf.setImage(with: imageURL)
//
//        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {

            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()

    }
    
}
