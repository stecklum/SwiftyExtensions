//
//  DateTests.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import XCTest
@testable import SwiftyExtensions

final class DateTests: XCTestCase {
    
    func testStartOfDayReturnsCorrectDate() {
        let startOfDay = Date.now.startOfDay()
        let startOfDay2 = Calendar.current.startOfDay(for: Date.now)
        XCTAssertEqual(startOfDay, startOfDay2)
    }
    
    func testStartOfDayReturnsNotNil() {
        let startOfDay = Date.now.startOfDay()
        XCTAssertNotNil(startOfDay)
    }
    
    func testEndOfDayReturnsCorretDate() {
        let endOfDay = Date.now.endOfDay()
        let endOfDay2 = Calendar.current.startOfDay(for: Date.now).addingTimeInterval(60 * 60 * 24)
        XCTAssertEqual(endOfDay, endOfDay2)
    }
    
    func testEndOfDayReturnsNotNil() {
        let endOfDay = Date.now.endOfDay()
        XCTAssertNotNil(endOfDay)
    }

}
