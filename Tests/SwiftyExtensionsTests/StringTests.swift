//
//  StringTests.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import XCTest
@testable import SwiftyExtensions

final class StringTests: XCTestCase {

    func testLocalizedShouldNotReturnNil() {
        let string = "Test"
        let localizedString = string.localized
        XCTAssertNotNil(localizedString)
    }
    
    func testLocalizedShouldReturnLocalizedString() {
        let string = "Test"
        let localizedString1 = string.localized
        let localizedString2 = NSLocalizedString(string, comment: "")
        XCTAssertEqual(localizedString1, localizedString2)
    }
    
    func testLocalizedWithCommentShouldNotReturnNil() {
        let string = "Test"
        let comment = "This is a comment"
        let localizedString = string.localized(with: comment)
        XCTAssertNotNil(localizedString)
    }
    
    func testLocalizedWithCommentShouldReturnLocalizedString() {
        let string = "Test"
        let comment = "This is a comment"
        let localizedString1 = string.localized(with: comment)
        let localizedString2 = NSLocalizedString(string, comment: "")
        XCTAssertEqual(localizedString1, localizedString2)
    }

}
