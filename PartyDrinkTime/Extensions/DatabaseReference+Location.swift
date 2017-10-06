//
//  DatabaseReference+Location.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/23.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseReference {
    enum MGLocation {
        // insert cases to read/write to locations in Firebase
        case root
        case profileImage(uid: String)
        case user
        case showUser(uid: String)
        case userName(uid: String, name: String)
        
        func asDatabaseReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
            case .profileImage(let uid):
                return root.child("profileImage").child(uid)
            case .user:
                return root.child("users")
            case .showUser(let uid):
                return root.child("users").child(uid)
            case .userName(let uid, let name):
                return root.child("users").child(uid).child(name)
            }
        }
    }
    
    static func toLocation(_ location: MGLocation) -> DatabaseReference {
        return location.asDatabaseReference()
    }
}
