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
    
    var stateAfterLoading: State = .content
    var stateAfterRetry: State = .content
    var didRetry: Bool = false
    
    var state: State {
        if didRetry {
            return stateAfterRetry
        } else {
            return stateAfterLoading
        }
    }
    
    func reset() {
        didRetry = false
    }
}
