//
//  ProfileImage.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/23.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class ProfileImage {
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    
    var dictValue: [String : Any] {
        return ["image_url" : imageURL,
                "image_height" : imageHeight]
    }

    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat
            else { return nil }
        
        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
    }
    
}
