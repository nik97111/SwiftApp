//
//  AppGBUITestsLaunchTests.swift
//  AppGBUITests
//
//  Created by Николай Чупреев on 04.01.2024.
//

import XCTest

final class AppGBUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Экран запуска"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
