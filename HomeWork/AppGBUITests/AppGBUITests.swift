//
//  AppGBUITests.swift
//  AppGBUITests
//
//  Created by Николай Чупреев on 04.01.2024.
//

import XCTest

class AppGBUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testAppLaunchesSuccessfully() {
        XCTAssertTrue(app.isHittable, "Приложение должно успешно запуститься")
    }
}
