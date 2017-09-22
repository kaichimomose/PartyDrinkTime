//
//  ProfileHeaderView.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/21.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    
    // MARK: - Subviews
    
    @IBOutlet weak var partiesCountLabel: UILabel!
    @IBOutlet weak var budiesCountLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileButton.layer.cornerRadius = 6
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        profileButton.layer.borderWidth = 1
        
        settingsButton.layer.cornerRadius = 6
        settingsButton.layer.borderColor = UIColor.lightGray.cgColor
        settingsButton.layer.borderWidth = 1
    }
    
    // MARK: - IBAction
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        print("profile button tapped")
    }
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        print("settings button tapped")
    }
}
