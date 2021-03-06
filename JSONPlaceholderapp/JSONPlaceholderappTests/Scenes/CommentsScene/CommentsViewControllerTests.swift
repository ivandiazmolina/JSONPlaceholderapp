//
//  CommentsViewControllerTests.swift
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

class CommentsViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: CommentsViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupCommentsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCommentsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class CommentsBusinessLogicSpy: CommentsBusinessLogic {
        
        var setupViewCalled = false
        var getcommentsCountCalled = false
        var getCommentCellForCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func getCommentsCount() -> Int {
            getcommentsCountCalled = true
            return 10
        }
        
        func getCommentCellFor(index: Int) -> Comments.Models.CommentCellModel {
            getCommentCellForCalled = true
            return Comments.Models.CommentCellModel()
        }
    }
    
    // MARK: Tests
}
