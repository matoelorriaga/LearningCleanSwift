//
//  CreateOrderPresenter.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 10/11/16.
//  Copyright (c) 2016 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderPresenterInput {
    func presentSomething(response: CreateOrder.Something.Response)
}

protocol CreateOrderPresenterOutput: class {
    func displaySomething(viewModel: CreateOrder.Something.ViewModel)
}

class CreateOrderPresenter: CreateOrderPresenterInput {
    
    weak var output: CreateOrderPresenterOutput!
    
    // MARK: - Presentation logic
    
    func presentSomething(response: CreateOrder.Something.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = CreateOrder.Something.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
    
}