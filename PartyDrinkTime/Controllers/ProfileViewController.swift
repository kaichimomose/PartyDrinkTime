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
import FirebaseDatabase

class ProfileViewController: UIViewController{
    @IBOutlet weak var profNameTextField: UITextField!
    @IBOutlet weak var profUsernameTextField: UITextField!
    @IBOutlet weak var profAgeTextField: UITextField!
    @IBOutlet weak var editImageButton: UIButton!
    @IBOutlet weak var profImageView: UIImageView!
    @IBOutlet var profileView: UIView!
    
    var user: User!
    
    var profileHandle: DatabaseHandle = 0
    var profileRef: DatabaseReference?
    
    var authHandle: AuthStateDidChangeListenerHandle?
    
    let photoHelper = MGPhotoHelper()
    var profileImage = [ProfileImage]()
    
    let refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        user = user ?? User.current
        
        profImageView.layer.cornerRadius = 6
        profImageView.layer.borderColor = UIColor.lightGray.cgColor
        profImageView.layer.borderWidth = 1
        
        //        configureView()
        reloadProfile()
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        user = user ?? User.current
//        
//        profImageView.layer.cornerRadius = 6
//        profImageView.layer.borderColor = UIColor.lightGray.cgColor
//        profImageView.layer.borderWidth = 1
//                
////        configureView()
//        reloadProfile()
//    }
    
    func reloadProfile(){
        photoHelper.completionHandler = { image in
            ProfileImageService.create(for: image)
        }
        
        profileHandle = UserService.observeProfile(for: user) { [unowned self] (ref, user, profileImage) in
            self.profileRef = ref
            self.user = user
            self.profileImage = profileImage
            
            DispatchQueue.main.async {
                
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
                
                let name = user?.name ?? "no name"
                self.profNameTextField.text = name
                self.profUsernameTextField.text = user?.username
                let imageURL = URL(string: self.profileImage[0].imageURL)
                self.profImageView.kf.setImage(with: imageURL)
                
                self.profileView.reloadInputViews()
            }
        }
        
    }
    
    deinit {
        profileRef?.removeObserver(withHandle: profileHandle)
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
                
                NameService.create(for: user) { (user) in
                    self.user.name = self.profNameTextField.text!
                }
                // 1
                let MydataViewController = segue.destination as! MydataViewController
                // 2
                MydataViewController.viewDidLoad()
            }
        }
    }
}
