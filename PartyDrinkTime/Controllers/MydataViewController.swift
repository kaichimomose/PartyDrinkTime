//
//  MydataViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/20.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class MydataViewController: UIViewController {
    
    // MARK: - VC Lifecycle
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    @IBAction func pastFutureSegueSwitched(_ sender: UISegmentedControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MydataViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
        cell.partyImageView.backgroundColor = .red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else {
            fatalError("Unexpected element kind.")
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as! ProfileHeaderView
        
        headerView.nameLabel.text = "Kaichi Momose"
        headerView.partiesCountLabel.text = "30"
        headerView.budiesCountLabel.text = "30"
        
        return headerView
    }
}
