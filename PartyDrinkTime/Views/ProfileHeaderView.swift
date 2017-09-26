//
//  ProfileHeaderView.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/22.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileHeaderViewDelegate: class {
    func didTapSettingButton(_ button: UIButton, on headerView: ProfileHeaderView)
}

class ProfileHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyCountLabel: UILabel!
    @IBOutlet weak var buddyCountLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    weak var delegate: ProfileHeaderViewDelegate?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 6
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        profileImageView.layer.borderWidth = 1

        profileButton.layer.cornerRadius = 6
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        profileButton.layer.borderWidth = 1
        
        settingButton.layer.cornerRadius = 6
        settingButton.layer.borderColor = UIColor.lightGray.cgColor
        settingButton.layer.borderWidth = 1
    }
    
    // MARK: - IBAction
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        print("profile button tapped")
    }
    
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        print("button tapped")
        delegate?.didTapSettingButton(sender, on: self)
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier {
//            if identifier == "displayProfile" {
//                print("Transitioning to the Display Profile View Controller")
//            }
//        }
//    }


}
