//
//  ProfileViewControllerTests.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import JSONPlaceholderapp
import XCTest

class ProfileViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: ProfileViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupProfileViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupProfileViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: Constants.Storyboard.profile, bundle: bundle)
        sut = storyboard.instantiateInitialViewController() as! ProfileViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class ProfileBusinessLogicSpy: ProfileBusinessLogic {
        
        var setupViewCalled = false
        var loadDataCalled = false
        var getAlbumsCountCalled = false
        var getAlbumCellForCalled = false
        var didSelectedAlbumAtCalled = false
        var getTodosCountCalled = false
        var getTodoCellForCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func loadData(request: Profile.Models.Request) {
            loadDataCalled = true
        }
        
        func getAlbumsCount() -> Int {
            getAlbumsCountCalled = true
            return 10
        }
        
        func getAlbumCellFor(index: Int) -> Profile.Models.AlbumCellModel {
            getAlbumCellForCalled = true
            return Profile.Models.AlbumCellModel()
        }
        
        func didSelectedAlbumAt(index: Int) {
            didSelectedAlbumAtCalled = true
        }
        
        func getTodosCount() -> Int {
            getTodosCountCalled = true
            return 10
        }
        
        func getTodoCellFor(index: Int) -> Profile.Models.TodoCellModel {
            getTodoCellForCalled = true
            return Profile.Models.TodoCellModel()
        }
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = ProfileBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        sut.setupView(viewModel: Profile.Models.ViewModel())
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "viewDidLoad() should ask the interactor to setupView()")
    }
}
