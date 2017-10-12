//
//  NameService.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/10/10.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NameService {
    static func create(for: User, completion: @escaping (User?) -> Void) {
        // create new name in database
        // 1
        let currentUser = User.current
        // 3
        let nameRef = Database.database().reference().child("users").child(currentUser.uid).child("name")
        //4
        nameRef.setValue(currentUser.name) { (error, nameRef) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
//            nameRef.observeSingleEvent(of: .value, with: { (snapshot) in
//                let user = User(snapshot: snapshot)
                completion(currentUser)
//            })
        }
    }
}
