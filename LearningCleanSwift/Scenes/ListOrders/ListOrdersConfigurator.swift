//
//  ListOrdersConfigurator.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 11/11/16.
//  Copyright (c) 2016 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ListOrdersViewController: ListOrdersPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension ListOrdersInteractor: ListOrdersViewControllerOutput {
}

extension ListOrdersPresenter: ListOrdersInteractorOutput {
}

class ListOrdersConfigurator {
    
    // MARK: - Object lifecycle
    
    static let sharedInstance = ListOrdersConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: ListOrdersViewController) {
        let router = ListOrdersRouter()
        router.viewController = viewController
        
        let presenter = ListOrdersPresenter()
        presenter.output = viewController
        
        let interactor = ListOrdersInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
}
