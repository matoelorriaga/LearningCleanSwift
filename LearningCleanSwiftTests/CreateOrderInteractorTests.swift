//
//  LearningCleanSwiftTests.swift
//  LearningCleanSwiftTests
//
//  Created by Matías Elorriaga on 10/11/16.
//  Copyright © 2016 melorriaga. All rights reserved.
//

import XCTest
@testable import LearningCleanSwift

class CreateOrderInteractorTests: XCTestCase {
    
    var createOrderInteractor: CreateOrderInteractor!
    
    override func setUp() {
        super.setUp()
        createOrderInteractor = CreateOrderInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    class CreateOrderInteractorOutputSpy: CreateOrderInteractorOutput {
        
        var presentExpirationDateCalled = false
        
        func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
            presentExpirationDateCalled = true
        }
        
    }
    
    func testShippingMethodsShouldReturnAllAvailableShippingMethods() {
        // given
        let allAvailableShippingMethods = [
            "Standard Shipping",
            "Two-Day Shipping",
            "One-Day Shipping"
        ]
        
        // when
        let returnedShippingMethods = createOrderInteractor.shippingMethods
        
        // then
        XCTAssertEqual(returnedShippingMethods, allAvailableShippingMethods)
    }
    
    func testFormatExpirationDateShouldAskPresenterToFormatExpirationDate() {
        // given
        let createOrderInteractorOutputSpy = CreateOrderInteractorOutputSpy()
        createOrderInteractor.output = createOrderInteractorOutputSpy
        
        let request = CreateOrder.FormatExpirationDate.Request(date: Date())
        
        // when
        createOrderInteractor.formatExpirationDate(request: request)
        
        // then
        XCTAssert(createOrderInteractorOutputSpy.presentExpirationDateCalled)
    }
    
}
