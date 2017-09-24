//
//  ProfileViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/23.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Kingfisher

class ProfileViewController: UIViewController{
    @IBOutlet weak var profNameLabel: UILabel!
    @IBOutlet weak var profUsernameLabel: UILabel!
    @IBOutlet weak var profAgeLabel: UILabel!
    @IBOutlet weak var editImageButton: UIButton!
    @IBOutlet weak var profImageView: UIImageView!
    
    let photoHelper = MGPhotoHelper()
    var profileImage = [ProfileImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profImageView.layer.cornerRadius = 6
        profImageView.layer.borderColor = UIColor.lightGray.cgColor
        profImageView.layer.borderWidth = 1
        
        photoHelper.completionHandler = { image in
            ProfileImageService.create(for: image)
        }
        
        UserService.profileImage(for: User.current) { (profileImage) in
            self.profileImage = profileImage
            let imageURL = URL(string: profileImage[0].imageURL)
            self.profImageView.kf.setImage(with: imageURL)
        }
    }
    
    @IBAction func editImageButtonTapped(_ sender: UIButton) {
        photoHelper.presentActionSheet(from: self)
    }

}
