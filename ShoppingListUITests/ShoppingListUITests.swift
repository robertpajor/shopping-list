//
//  ShoppingListUITests.swift
//  ShoppingListUITests
//
//  Created by Robert Pajor on 09/07/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import XCTest

class ShoppingListUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testExample() {
        XCUIApplication().otherElements.containing(.staticText, identifier: "Make a List").element.tap()
        XCTAssertTrue(true)
    }

}
