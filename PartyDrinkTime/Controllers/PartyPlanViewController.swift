//
//  PartyPlanViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/16.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

typealias ListCallBack = (List) -> Void

class PartyPlanViewController: UIViewController {

    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var partyPlaceTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var partyDatePicker: UIDatePicker!
    
    //var listCallBack: ListCallBack?
    var delegate: ListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            
            var list = List()
            
            list.partyName = partyNameTextField.text ?? ""
            
//            list.partyDate = Date()
            
            if list.partyName != "" {
                delegate?.addLists(list: list)
            }
            
            print("save button tapped")
        }
        else if segue.identifier == "cancel" {
            print("cancel button tapped")
        }
    }
    
}
