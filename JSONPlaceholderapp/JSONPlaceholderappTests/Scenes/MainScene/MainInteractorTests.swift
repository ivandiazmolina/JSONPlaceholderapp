//
//  MainInteractorTests.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 08/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import JSONPlaceholderapp
import XCTest

class MainInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MainInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupMainInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainInteractor() {
        sut = MainInteractor()
    }
    
    // MARK: Test doubles
    
    class MainPresentationLogicSpy: MainPresentationLogic {
        
        var setupViewCalled = false
        var presentPostsAndUsersCalled = false
        
        func setupView(response: Main.Models.Response) {
            setupViewCalled = true
        }
        
        func presentPostsAndUsers(response: Main.Models.Response) {
            presentPostsAndUsersCalled = true
        }
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = MainPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.setupView()
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "setupView() should ask the presenter to format the result")
    }
}