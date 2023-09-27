//
//  FlavorVerseUITestsLaunchTests.swift
//  FlavorVerseUITests
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains UI tests for launching the FlavorVerse application. It includes a test case for
//  verifying that the app can be successfully launched and captures a screenshot of the launch screen.
//  XCTest and XCTestUI are used as the testing frameworks.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: These tests are essential for ensuring that the FlavorVerse app can be launched and its initial
//  state is captured for reference.
//


import XCTest

final class FlavorVerseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
