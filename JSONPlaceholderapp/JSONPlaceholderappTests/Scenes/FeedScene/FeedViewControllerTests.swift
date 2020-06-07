//
//  FeedViewControllerTests.swift
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

class FeedViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: FeedViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupFeedViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupFeedViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: Constants.Storyboard.feed, bundle: bundle)
        sut = storyboard.instantiateInitialViewController() as! FeedViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class FeedBusinessLogicSpy: FeedBusinessLogic {
        
        var setupViewCalled = false
        var setPostsCalled = false
        var getPostsCountCalled = false
        var getPostCellForCalled = false
        var loadCommentsCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func setPosts(_ posts: [Post]) {
            setPostsCalled = true
        }
        
        func getPostsCount() -> Int {
            getPostsCountCalled = true
            return 10
        }
        
        func getPostCellFor(index: Int) -> Feed.Models.PostCellModel {
            getPostCellForCalled = true
            return Feed.Models.PostCellModel()
        }
        
        func loadComments(for post: Post) {
            loadCommentsCalled = true
        }
    }
    
    // MARK: Tests
}
