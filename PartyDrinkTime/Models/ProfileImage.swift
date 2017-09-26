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
    let profiler: User
    
    var dictValue: [String : Any] {
        let userDict = ["uid" : profiler.uid,
                        "username" : profiler.username]
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "profiler" : userDict]
    }

    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.profiler = User.current
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let userDict = dict["profiler"] as? [String : Any],
            let uid = userDict["uid"] as? String,
            let username = userDict["username"] as? String
            else { return nil }
        
        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.profiler = User(uid: uid, username: username)
    }
    
}
