//
//  ErrorViewController.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

protocol ErrorViewControllerDelegate: AnyObject {
    func didRetry()
}

final class ErrorViewController: UIViewController {
    
    weak var delegate: ErrorViewControllerDelegate?
    
    @IBAction func doRetry() {
        Settings.shared.didRetry = true
        delegate?.didRetry()
    }
}
