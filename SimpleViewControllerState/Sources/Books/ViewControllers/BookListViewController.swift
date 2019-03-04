//
//  BookListViewController.swift
//  SimpleViewControllerState
//
//  Created by Mario Negro on 04/03/2019.
//  Copyright © 2019 Mario Negro. All rights reserved.
//

import UIKit

protocol BookListViewControllerDelegate: AnyObject {
    func didFailFetching()
    func didReceiveNoData()
}

final class BookListViewController: UIViewController, LoadingHandler {
    
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: BookListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func fetchData() {
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.label.isHidden = false
            self.notifyAfterWait()
        }
    }
    
    private func notifyAfterWait() {
        let settings = Settings.shared
        switch settings.initialState {
        case .empty,
             .error where settings.didRetry && settings.showEmptyAfterRetry:
            self.delegate?.didReceiveNoData()
        case .content,
             .error where settings.didRetry && settings.showContentAfterRetry:
            break // Does nothing, shows content as fallback
        case .error:
            self.delegate?.didFailFetching()
        }
    }
    
}
