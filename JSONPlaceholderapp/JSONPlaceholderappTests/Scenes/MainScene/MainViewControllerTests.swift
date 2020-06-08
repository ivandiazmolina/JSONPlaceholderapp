//
//  MainViewControllerTests.swift
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

class MainViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MainViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class MainBusinessLogicSpy: MainBusinessLogic {
        
        var setupViewCalled = false
        var getInitialDataCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func getInitialData() {
            getInitialDataCalled = true
        }
    }
    
    // MARK: Tests
}
