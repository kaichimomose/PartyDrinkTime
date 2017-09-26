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
    @IBOutlet var profileView: UIView!
    
    let photoHelper = MGPhotoHelper()
    var profileImage = [ProfileImage]()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profImageView.layer.cornerRadius = 6
        profImageView.layer.borderColor = UIColor.lightGray.cgColor
        profImageView.layer.borderWidth = 1
                
//        configureView()
        reloadProfile()
        
    }
    
    func reloadProfile(){
        photoHelper.completionHandler = { image in
            ProfileImageService.create(for: image)
        }
        
        UserService.profileImage(for: User.current) { (profileImage) in
            self.profileImage = profileImage
            
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
            
            let imageURL = URL(string: self.profileImage[0].imageURL)
            self.profImageView.kf.setImage(with: imageURL)
            
            self.profileView.reloadInputViews()
        }
    }
    
    func configureView() {
        // add pull to refresh
        refreshControl.addTarget(self, action: #selector(reloadProfile), for: .valueChanged)
        profileView.addSubview(refreshControl)
    }
    @IBAction func editImageButtonTapped(_ sender: UIButton) {
        photoHelper.presentActionSheet(from: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "done" {
                print("Done button tapped")
                
                // 1
                let MydataViewController = segue.destination as! MydataViewController
                // 2
                MydataViewController.viewDidLoad()
            }
        }
    }
}
