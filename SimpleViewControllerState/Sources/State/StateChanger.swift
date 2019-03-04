//
//  StateChanger.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 05/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import Foundation

protocol StateChanger: AnyObject {
    func changeTo(state: State)
}
