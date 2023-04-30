//
//  CalendarTests.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import XCTest
@testable import SwiftyExtensions

final class CalendarTests: XCTestCase {

    func testNumberOfDaysBetweenReturnsCorrectValue() {
        guard let fromDate = Calendar.current.date(byAdding: .day, value: -5, to: Date.now) else {
            XCTFail()
            return
        }
        let toDate = Date.now
        
        guard let numberOfDays = try? Calendar.current.numberOfDaysBetween(fromDate, and: toDate) else {
            XCTAssertThrowsError(DateErrors.invalidDateComponents)
            return
        }
        
        XCTAssertEqual(numberOfDays, 6)
    }
    
    func testNumberOfDaysBetwwenReturnsInt() {
        guard let fromDate = Calendar.current.date(byAdding: .day, value: -5, to: Date.now) else {
            XCTFail()
            return
        }
        let toDate = Date.now
        
        guard let numberOfDays = try? Calendar.current.numberOfDaysBetween(fromDate, and: toDate) else {
            XCTAssertThrowsError(DateErrors.invalidDateComponents)
            return
        }
        
        XCTAssertEqual(numberOfDays, 6)
        assert((numberOfDays as Any) is Int)
    }

}
