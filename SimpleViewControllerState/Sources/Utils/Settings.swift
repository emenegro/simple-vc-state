//
//  Settings.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import Foundation

final class Settings {
    static let shared = Settings()
    
    var initialState: State = .content
    var didRetry: Bool = false
    var showContentAfterRetry: Bool = false
    var showEmptyAfterRetry: Bool = false
    
    func reset() {
        initialState = .content
        didRetry = false
        showContentAfterRetry = false
        showEmptyAfterRetry = false
    }
}
