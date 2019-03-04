//
//  MenuViewController.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

final class MenuViewController: UITableViewController {
    
    enum Option: Int {
        case success, empty, error, errorThenContent, errorThenEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Settings.shared.reset()
        
        switch Option(rawValue: indexPath.row) {
        case .success?:
            Settings.shared.initialState = .content
        case .empty?:
            Settings.shared.initialState = .empty
        case .error?:
            Settings.shared.initialState = .error
        case .errorThenContent?:
            Settings.shared.showContentAfterRetry = true
            Settings.shared.initialState = .error
        case .errorThenEmpty?:
            Settings.shared.showEmptyAfterRetry = true
            Settings.shared.initialState = .error
        default:
            break
        }
        
        let stateProvider = BooksStateProvider()
        let stateContainerViewController = StateContainerViewController(stateProvider: stateProvider)
        
        show(stateContainerViewController, sender: self)
    }
}
