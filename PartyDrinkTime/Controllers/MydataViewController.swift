//
//  MydataViewController.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/20.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class MydataViewController: UIViewController {
    
    // MARK: - Properties
    
    var user: User!
    var profileImages = [ProfileImage]()
    
    var profileHandle: DatabaseHandle = 0
    var profileRef: DatabaseReference?
    
    var authHandle: AuthStateDidChangeListenerHandle?
    
    let refreshControl = UIRefreshControl()
    
    // MARK: - VC Lifecycle
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = user ?? User.current
        
        // add pull to refresh
        refreshControl.addTarget(self, action: #selector(self.collectionView.reloadData), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        //
        
        profileHandle = UserService.observeProfile(for: user) { [unowned self] (ref, user, profileImage) in
            self.profileRef = ref
            self.user = user
            self.profileImages = profileImage
            
            DispatchQueue.main.async {
                
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
                
                self.collectionView.reloadData()
            }
        }
    }
    
    deinit {
        profileRef?.removeObserver(withHandle: profileHandle)
    }
    
    @IBAction func unwindToMydataViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else {
            fatalError("Unexpected element kind.")
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as! ProfileHeaderView
        
        let partyCount = user.partyCount ?? 0
        headerView.partyCountLabel.text = "\(partyCount)"
        
        let buddyCount = user.buddyCount ?? 0
        headerView.buddyCountLabel.text = "\(buddyCount)"
        
        headerView.nameLabel.text = user.username
        
//        let profileImage = self.profileImages[0]
//        let imageURL = URL(string: profileImage.imageURL)
//        headerView.profileImageView.kf.setImage(with: imageURL)
        
        UserService.profileImage(for: User.current) { (profileImage) in
            self.profileImages = profileImage
            let imageURL = URL(string: self.profileImages[0].imageURL)
            headerView.profileImageView.kf.setImage(with: imageURL)
        }

        
        //headerView.profileImageView.backgroundColor = .red
        
        return headerView
    }
}

extension MydataViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 3
        let spacing: CGFloat = 1.5
        let totalHorizontalSpacing = (columns - 1) * spacing
        
        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
        let itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
}

extension MydataViewController: ProfileHeaderViewDelegate {
    func didTapSettingButton(_ button: UIButton, on headerView: ProfileHeaderView) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .default) { _ in
            do {
                try Auth.auth().signOut()
            } catch let error as NSError {
                assertionFailure("Error signing out: \(error.localizedDescription)")
            }
        }
        alertController.addAction(signOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
