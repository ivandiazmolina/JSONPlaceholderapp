//
//  FeedWorkerTests.swift
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

class FeedWorkerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: FeedWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupFeedWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupFeedWorker() {
        sut = FeedWorker()
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
}