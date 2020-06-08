//
//  ExploreViewControllerTests.swift
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

class ExploreViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: ExploreViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupExploreViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupExploreViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class ExploreBusinessLogicSpy: ExploreBusinessLogic {
        
        var setupViewCalled = false
        var didSelectedItemAtCalled = false
        var setUsersCalled = false
        var getUsersCountCalled = false
        var getUserCellForCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func didSelectedItemAt(index: Int) {
            didSelectedItemAtCalled = true
        }
        
        func setUsers(_ users: [User]) {
            setUsersCalled = true
        }
        
        func getUsersCount() -> Int {
            getUsersCountCalled = true
            return 10
        }
        
        func getUserCellFor(index: Int) -> Explore.Models.UserCellModel {
            getUserCellForCalled = true
            return Explore.Models.UserCellModel()
        }
    }
    
    // MARK: Tests
}