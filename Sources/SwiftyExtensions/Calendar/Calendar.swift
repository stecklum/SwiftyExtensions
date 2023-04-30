//
//  Calendar.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import Foundation

extension Calendar {
    
    func numberOfDaysBetween(_ from: Date, and to: Date) throws -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let days = dateComponents([.day], from: fromDate, to: toDate)
        guard let day = days.day else { throw DateErrors.invalidDateComponents }
        let numberOfDays = day + 1
        return numberOfDays
    }
    
}
