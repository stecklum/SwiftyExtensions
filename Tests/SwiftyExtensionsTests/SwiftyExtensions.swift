//
//  SwiftyExtensions.swift
//  
//
//  Created by Tom Stecklum on 29.04.23.
//

import XCTest
@testable import SwiftyExtensions

final class SwiftyExtensions: XCTestCase {

    func testInit() {
        let swiftyExtensions = SwiftyExtensions.init()
        XCTAssertNotNil(swiftyExtensions)
        XCTAssertTrue(swiftyExtensions.isEqual(SwiftyExtensions()))
    }

}
