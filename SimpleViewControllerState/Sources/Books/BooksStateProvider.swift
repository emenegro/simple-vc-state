//
//  BooksStateProvider.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

class BooksStateProvider: StateProvider {

    var initialState: State = .content
    var title: String = "Books"
    weak var stateChanger: StateChanger?
    
    func contentViewController() -> UIViewController {
        guard let contentViewController: BookListViewController = UIStoryboard.makeViewController(withId: "ContentViewController") else {
            fatalError("Content should be present")
        }
        
        contentViewController.delegate = self
        return contentViewController
    }
    
    func errorViewController() -> UIViewController? {
        let errorViewController: ErrorViewController? = UIStoryboard.makeViewController(withId: "ErrorViewController")
        errorViewController?.delegate = self
        return errorViewController
    }
    
    func emptyViewController() -> UIViewController? {
        let emptyViewController: EmptyViewController? = UIStoryboard.makeViewController(withId: "EmptyViewController")
        return emptyViewController
    }
}

extension BooksStateProvider: ErrorViewControllerDelegate {
    func didRetry() {
        stateChanger?.changeTo(state: .content)
    }
}

extension BooksStateProvider: BookListViewControllerDelegate {
    func didFailFetching() {
        stateChanger?.changeTo(state: .error)
    }
    
    func didReceiveNoData() {
        stateChanger?.changeTo(state: .empty)
    }
}
