import XCTest
@testable import SwiftyExtensions

final class StringOptionalTests: XCTestCase {
    
    func testUnwrappedStringShouldReturnEmtpyStringIfStringIsNil() {
        let string: String? = nil
        let unwrappedString = string.unwrapped
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, "")
    }
    
    func testUnwrappedStringShouldReturnEmtpyStringIfStringIsEmpty() {
        let string: String? = ""
        let unwrappedString = string.unwrapped
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, "")
    }
    
    func testUnwrappedStringShouldReturnStringIfStringIsNotEmpty() {
        let string: String? = "Test"
        let unwrappedString = string.unwrapped
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, "Test")
        XCTAssertEqual(string?.count, unwrappedString.count)
    }
    
    func testUnwrappedStringWithReplacementShouldReturnEmtpyStringIfStringIsNil() {
        let string: String? = nil
        let replacement: String = "DefaultValue"
        let unwrappedString = string.unwrapped(or: replacement)
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, replacement)
    }
    
    func testUnwrappedStringWithReplacementShouldReturnEmtpyStringIfStringIsEmpty() {
        let string: String? = ""
        let replacement: String = "DefaultValue"
        let unwrappedString = string.unwrapped(or: replacement)
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, "")
    }
    
    func testUnwrappedStringWithReplacementShouldReturnStringIfStringIsNotEmpty() {
        let string: String? = "Test"
        let replacement: String = "DefaultValue"
        let unwrappedString = string.unwrapped(or: replacement)
        XCTAssertNotNil(unwrappedString)
        XCTAssertEqual(unwrappedString, "Test")
        XCTAssertEqual(string?.count, unwrappedString.count)
    }
    
    func testIsNullOrEmptyShouldReturnTrueIfDataIsNil() {
        let string: String? = nil
        let isNullOrEmpty = string.isNullOrEmpty
        XCTAssertEqual(true, isNullOrEmpty)
    }
    
    func testIsNullOrEmptyShouldReturnTrueIfDataIsEmpty() {
        let string: String? = ""
        let isNullOrEmpty = string.isNullOrEmpty
        XCTAssertEqual(true, isNullOrEmpty)
    }
    
    func testIsNullOrEmptyShouldReturnFalseIfDataIsNotEmpty() {
        let string: String? = "Test"
        let isNullOrEmpty = string.isNullOrEmpty
        XCTAssertEqual(false, isNullOrEmpty)
    }
    
}
