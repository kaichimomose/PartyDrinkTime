//
//  FuturePartyListTableViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/15.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class FuturePartyListTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lists = [List]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToFuturePartyListTableViewController(_ segue: UIStoryboardSegue) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            print("back Tapped")
            let mydataViewController = segue.destination as! MydataViewController
            mydataViewController.viewDidLoad()
        } else if segue.identifier == "add party" {
            let partyPlanViewContorller = segue.destination as! PartyPlanViewController
            partyPlanViewContorller.listCallBack = self.addLists
            print("+ button tapped")
        }
    }
    
    func addLists(list: List) {
        lists.append(list)
    }
    
}

extension FuturePartyListTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "futurePartyListTableViewCell", for: indexPath) as! FuturePartyListTableViewCell
        
        let row = indexPath.row
        
        let list = lists[row]

        cell.partyNameLabel.text = list.partyName

        cell.partyDateLabel.text = list.partyDate

//        cell.moodModificationTimeLabel.text = list.modificationTime.convertToString()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            let row = indexPath.row

            lists.remove(at: row)
        }
    }
}

extension FuturePartyListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
