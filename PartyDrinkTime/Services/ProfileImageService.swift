//
//  ProfileImageService.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/23.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct ProfileImageService {
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            create(forURLString: urlString, aspectHeight: aspectHeight)
        }
    }
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
        // create new profile in database
        // 1
        let currentUser = User.current
        // 2
        let profileImage = ProfileImage(imageURL: urlString, imageHeight: aspectHeight)
        // 3
        let dict = profileImage.dictValue
        
        // 4
        let postRef = Database.database().reference().child("profileImage").child(currentUser.uid).childByAutoId()
        //5
        postRef.updateChildValues(dict)
    }
}
