//
//  StateProvider.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

protocol StateProvider: AnyObject {
    var initialState: State { get }
    var title: String { get }
    var stateChanger: StateChanger? { get set }
    
    func contentViewController() -> UIViewController
    func errorViewController() -> UIViewController?
    func emptyViewController() -> UIViewController?
}
