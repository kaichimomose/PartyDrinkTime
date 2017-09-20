//
//  Storyboard+Utility.swift
//  PartyDrinkTime
//
//  Created by Kaichi Momose on 2017/09/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum PDTType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: PDTType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: PDTType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
}
