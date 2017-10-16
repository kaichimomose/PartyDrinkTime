//
//  FuturePartyListTableViewCell.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/15.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class FuturePartyListTableViewCell: UITableViewCell {
    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var partyDateLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("button tapped")
    }
    
}
