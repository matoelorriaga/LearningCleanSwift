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
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
}

protocol CreateOrderPresenterOutput: class {
    func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel)
}

class CreateOrderPresenter: CreateOrderPresenterInput {
    
    weak var output: CreateOrderPresenterOutput!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    // MARK: - Present something
    
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let date = dateFormatter.string(from: response.date)
        let viewModel = CreateOrder.FormatExpirationDate.ViewModel(date: date)
        output.displayExpirationDate(viewModel: viewModel)
    }
    
}
