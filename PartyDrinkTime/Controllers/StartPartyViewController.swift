//
//  StartPartyViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/16.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

typealias ListSender = (List) -> Void

class StartPartyViewController: UIViewController {
    
    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var partyPlaceTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!

    var list = List()
    var listSender: ListSender?
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("button tapped")
        
        list.partyName = partyNameTextField.text ?? ""
        list.partyPlace = partyPlaceTextField.text ?? ""
        
        listSender?(list)
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

