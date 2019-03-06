//
//  StateContainerViewController.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

enum State: Int {
    case content
    case error
    case empty
}

class StateContainerViewController: UIViewController, StateChanger {
    
    private let stateProvider: StateProvider
    private var currentState: State?
    
    // MARK: - Object initialization
    
    init(stateProvider: StateProvider) {
        self.stateProvider = stateProvider
        
        super.init(nibName: nil, bundle: nil)
        
        self.stateProvider.stateChanger = self
        self.title = self.stateProvider.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        changeTo(state: stateProvider.initialState)
    }
    
    // MARK: - State management
    
    func changeTo(state: State) {
        guard currentState != state else {
            return
        }
        
        currentState = state
        
        switch state {
        case .content:
            removePreviousChildAndAdd(viewController: stateProvider.contentViewController())
        case .error:
            removePreviousChildAndAdd(viewController: stateProvider.errorViewController())
        case .empty:
            removePreviousChildAndAdd(viewController: stateProvider.emptyViewController())
        }
    }
}
