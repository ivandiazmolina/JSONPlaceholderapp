//
//  XCTest+Additions.swift
//  JSONPlaceholderappTests
//
//  Created by Iván Díaz Molina on 08/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import XCTest

extension XCTestCase {

    func waitUI(_ withDelay: Double = 0) {
        let uiExpectation = expectation(description: "UI Waiting")
        DispatchQueue.main.asyncAfter(deadline: .now() + withDelay + 0.2) {
            uiExpectation.fulfill()
        }
        waitForExpectations(timeout: withDelay + 1, handler: nil)
    }
}
