//
//  SettingsViewController.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 06/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var afterRetrySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Settings.shared.reset()
    }
    
    @IBAction func stateAfterLoadingValueChanged(sender: UISegmentedControl) {
        guard let newState = State(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        
        Settings.shared.stateAfterLoading = newState
        
        if case .error = newState {
            afterRetrySegmentedControl.isEnabled = true
        } else {
            afterRetrySegmentedControl.isEnabled = false
        }
    }
    
    @IBAction func stateAfterRetryValueChanged(sender: UISegmentedControl) {
        guard let newState = State(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        
        Settings.shared.stateAfterRetry = newState
    }
    
    @IBAction func doContinue() {
        let stateProvider = BooksStateProvider()
        let stateContainerViewController = StateContainerViewController(stateProvider: stateProvider)
        show(stateContainerViewController, sender: self)
    }
}
