//
//  ListOrdersViewControllerTests.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 11/11/16.
//  Copyright (c) 2016 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import LearningCleanSwift
import XCTest

class ListOrdersViewControllerTests: XCTestCase {
    
    var window: UIWindow!
    
    // MARK: - Subject under test
    
    var sut: ListOrdersViewController!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupListOrdersViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupListOrdersViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ListOrdersViewController") as! ListOrdersViewController
        loadView()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    // MARK: - Tests
    
    func testSomething() {
        // given
        // when
        // then
    }
    
}
