//
//  StartPartyViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/16.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class StartPartyViewController: UIViewController, AlertPresentable {
    
    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var partyPlaceTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!

    var list = List()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startParty" {
            let drinkCountViewController = segue.destination as! DrinkCountViewController
            
            list.partyName = partyNameTextField.text ?? ""
            
            if list.partyName == ""{
                self.startPartyAlart()
            }
            
            list.partyPlace = partyPlaceTextField.text ?? ""
            
            drinkCountViewController.list = self.list
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("button tapped")
        
//        list.partyName = partyNameTextField.text ?? ""
//        list.partyPlace = partyPlaceTextField.text ?? ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

