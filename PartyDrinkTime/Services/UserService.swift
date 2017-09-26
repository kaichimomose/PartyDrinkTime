//
//  UserService.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = DatabaseReference.toLocation(.showUser(uid: uid))
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(user)
        })
    }
    
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs: [String : Any] = ["username": username,
                                         "party_count": 0,
                                         "buddy_count" : 0]
        
        let ref = DatabaseReference.toLocation(.showUser(uid: firUser.uid))
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
    
    static func profileImage(for user: User, completion: @escaping ([ProfileImage]) -> Void) {
        let ref = DatabaseReference.toLocation(.profileImage(uid: user.uid))
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let profileImage = snapshot.reversed().flatMap(ProfileImage.init)
            completion(profileImage)
        })
    }
    
    static func observeProfile(for user: User, completion: @escaping (DatabaseReference, User?, [ProfileImage]) -> Void) -> DatabaseHandle {
        // 1
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // 2
        return userRef.observe(.value, with: { (snapshot) in
            // 3
            guard let user = User(snapshot: snapshot) else {
                return completion(userRef, nil, [])
            }
            
            // 4
            profileImage(for: user, completion: { profileImage in
                // 5
                completion(userRef, user, profileImage)
            })
        })
    }
}
