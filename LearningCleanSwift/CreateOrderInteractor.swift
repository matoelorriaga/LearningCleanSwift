//
//  CreateOrderInteractor.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 10/11/16.
//  Copyright (c) 2016 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderInteractorInput {
    func doSomething(request: CreateOrder.Something.Request)
}

protocol CreateOrderInteractorOutput {
    func presentSomething(response: CreateOrder.Something.Response)
}

class CreateOrderInteractor: CreateOrderInteractorInput {
    
    var output: CreateOrderInteractorOutput!
    var worker: CreateOrderWorker!
    
    // MARK: - Business logic
    
    func doSomething(request: CreateOrder.Something.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = CreateOrderWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = CreateOrder.Something.Response()
        output.presentSomething(response: response)
    }
    
}