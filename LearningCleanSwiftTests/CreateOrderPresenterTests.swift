//
//  CreateOrderPresenterTests.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 10/11/16.
//  Copyright © 2016 melorriaga. All rights reserved.
//

import XCTest
@testable import LearningCleanSwift

class CreateOrderPresenterTests: XCTestCase {
    
    var createOrderPresenter: CreateOrderPresenter!
    
    override func setUp() {
        super.setUp()
        createOrderPresenter = CreateOrderPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    class CreateOrderPresenterOutputSpy: CreateOrderPresenterOutput {
        
        var displayExpirationDateCalled = false
        var createOrderFormatExpirationDateViewModel: CreateOrder.FormatExpirationDate.ViewModel!
        
        func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel) {
            displayExpirationDateCalled = true
            createOrderFormatExpirationDateViewModel = viewModel
        }
        
    }
    
    func testPresentExpirationDateShouldConvertDateToString() {
        // given
        let createOrderPresenterOutputSpy = CreateOrderPresenterOutputSpy()
        createOrderPresenter.output = createOrderPresenterOutputSpy
        
        var dateComponents = DateComponents()
        dateComponents.year = 2007
        dateComponents.month = 6
        dateComponents.day = 29
        let date = Calendar.current.date(from: dateComponents)!
        let response = CreateOrder.FormatExpirationDate.Response(date: date)
        
        // when
        createOrderPresenter.presentExpirationDate(response: response)
        
        // then
        let returnedDate = createOrderPresenterOutputSpy.createOrderFormatExpirationDateViewModel.date
        let expectedDate = "6/29/07"
        XCTAssertEqual(returnedDate, expectedDate)
    }
    
    func testPresentExpirationDateShouldAskViewControllerToDisplayExpirationDate() {
        // given
        let createOrderPresenterOutputSpy = CreateOrderPresenterOutputSpy()
        createOrderPresenter.output = createOrderPresenterOutputSpy
        
        let response = CreateOrder.FormatExpirationDate.Response(date: Date())
        
        // when
        createOrderPresenter.presentExpirationDate(response: response)
        
        // then
        XCTAssert(createOrderPresenterOutputSpy.displayExpirationDateCalled)
    }
    
}
