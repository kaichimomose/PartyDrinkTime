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
    
//    var lists = [List]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    @IBAction func unwindToListMoodViewController(_ segue: UIStoryboardSegue) {
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            print("back Tapped")
            let MydataViewController = segue.destination as! MydataViewController
            MydataViewController.viewDidLoad()
        } else if segue.identifier == "addMood" {
            
            print("+ button tapped")
        }
    }
    
}

extension FuturePartyListTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "futurePartyListTableViewCell", for: indexPath) as! FuturePartyListTableViewCell
        
        //let row = indexPath.row
        
//        let list = lists[row]
//
        cell.backgroundColor = .red
//        cell.nameLabel.text = list.name
//
//        cell.moodLabel.text = list.mood
//
//        cell.moodModificationTimeLabel.text = list.modificationTime.convertToString()
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//
//            let row = indexPath.row
//
//            lists.remove(at: row)
//        }
//    }
}
