//
//  DrinkCountViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/16.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class DrinkCountViewController: UIViewController {

    @IBOutlet weak var drink1Button: UIButton!
    @IBOutlet weak var drink1CounterLabel: UILabel!
    @IBOutlet weak var drink2Button: UIButton!
    @IBOutlet weak var drink2CounterLabel: UILabel!
    @IBOutlet weak var drink3Button: UIButton!
    @IBOutlet weak var drink3CounterLabel: UILabel!
    @IBOutlet weak var drink4Button: UIButton!
    @IBOutlet weak var drink4CounterLabel: UILabel!
    
    var drink1Count = 0
    var drink2Count = 0
    var drink3Count = 0
    var drink4Count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drink1Button.layer.cornerRadius = 6
        drink1Button.layer.borderColor = UIColor.lightGray.cgColor
        drink1Button.layer.borderWidth = 1
        
        drink2Button.layer.cornerRadius = 6
        drink2Button.layer.borderColor = UIColor.lightGray.cgColor
        drink2Button.layer.borderWidth = 1
        
        drink3Button.layer.cornerRadius = 6
        drink3Button.layer.borderColor = UIColor.lightGray.cgColor
        drink3Button.layer.borderWidth = 1
        
        drink4Button.layer.cornerRadius = 6
        drink4Button.layer.borderColor = UIColor.lightGray.cgColor
        drink4Button.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drink1ButtonTapped(_ sender: UIButton) {
        self.drink1Count += 1
        drink1CounterLabel.text = String(self.drink1Count)

    }
    @IBAction func drink2ButtonTapped(_ sender: UIButton) {
        self.drink2Count += 1
        drink2CounterLabel.text = String(self.drink2Count)
    }
    @IBAction func drink3ButtonTapped(_ sender: UIButton) {
        self.drink3Count += 1
        drink3CounterLabel.text = String(self.drink3Count)
    }
    @IBAction func drink4ButtonTapped(_ sender: UIButton) {
        self.drink4Count += 1
        drink4CounterLabel.text = String(self.drink4Count)
    }

}
