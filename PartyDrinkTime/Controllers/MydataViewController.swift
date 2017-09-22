//
//  MydataViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/20.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

import UIKit

class MydataViewController: UIViewController {
    
    // MARK: - VC Lifecycle
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
extension MydataViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartyImageCell", for: indexPath) as! PartyImageCell
        cell.partyImageView.backgroundColor = .red
        
        return cell
    }
}
