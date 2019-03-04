//
//  UIStoryboard+Extensions.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func makeViewController<T>(withId id: String) -> T? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? T
    }
}
