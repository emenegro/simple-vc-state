//
//  UIViewController+Extensions.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChild(viewController: UIViewController) {
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
    
    func removeChild(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        viewController.didMove(toParent: nil)
    }
    
    func removeAllChildViewControllers() {
        children.forEach({ removeChild(viewController: $0) })
    }
    
    func removePreviousChildAndAdd(viewController: UIViewController?) {
        guard let viewController = viewController else {
            return
        }
        
        removeAllChildViewControllers()
        addChild(viewController: viewController)
    }
}
