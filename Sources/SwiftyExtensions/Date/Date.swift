//
//  Date.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import Foundation

extension Date {
    
    func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
    
    func endOfDay() -> Date {
        Calendar.current.startOfDay(for: self).addingTimeInterval(60 * 60 * 24)
    }
    
    func startOfMonth() -> Date {
        let comps = Calendar.current.dateComponents([.year, .month], from: self)
        guard let startOfMonth = Calendar.current.date(from: comps) else { return Date.distantPast }
        return startOfMonth
    }
    
    func endOfMonth() -> Date {
        let comps = Calendar.current.dateComponents([.year, .month], from: self)
        guard
            let date = Calendar.current.date(from: comps),
            let lastDayOfMonth = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: date)
        else { return Date.distantFuture }
        return lastDayOfMonth
    }
    
    func startOfYear() -> Date {
        let comps = Calendar.current.dateComponents([.year], from: self)
        guard let startOfYear = Calendar.current.date(from: comps) else { return Date.distantPast }
        return startOfYear
    }
    
    func endOfYear() -> Date {
        let comps = Calendar.current.dateComponents([.year], from: self)
        guard
            let date = Calendar.current.date(from: comps),
            let lastDayOfYear = Calendar.current.date(byAdding: DateComponents(month: 12, day: -1), to: date)
        else { return Date.distantFuture }
        return lastDayOfYear
    }
    
    func daysOfMonth() -> [Date] {
        let comps = Calendar.current.dateComponents([.year, .month], from: self)
        guard
            let monthRange = Calendar.current.range(of: .day, in: .month, for: self),
            var date = Calendar.current.date(from: comps)
        else { return [] }
        var dates: [Date] = []
        monthRange.forEach { _ in
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { return }
            date = newDate
        }
        return dates
    }
    
    func daysOfYear() -> [Date] {
        let comps = Calendar.current.dateComponents([.year], from: self)
        guard
            let yearRange = Calendar.current.range(of: .day, in: .year, for: self),
            var date = Calendar.current.date(from: comps)
        else { return [] }
        var dates: [Date] = []
        yearRange.forEach { _ in
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { return }
            date = newDate
        }
        return dates
    }
    
    func daysBetween(since date: Date) throws -> [Date] {
        let startDayComps = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let endDayComps = Calendar.current.dateComponents([.year, .month, .day], from: self)
        guard let endDay = Calendar.current.date(from: endDayComps),
              var startDay = Calendar.current.date(from: startDayComps)
        else { throw DateErrors.invalidDateComponents }
        let monthRange = try Calendar.current.numberOfDaysBetween(date, and: endDay)
        var dates = [Date]()
        let sequence = 0 ..< monthRange
        sequence.forEach { _ in
            dates.append(startDay)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: startDay) else { return }
            startDay = newDate
        }
        return dates
    }
    
    static func randomBetween(from startDate: Date, until endDate: Date) -> Date {
        var date1 = startDate
        var date2 = endDate
        if date2 < date1 {
            let temp = date1
            date1 = date2
            date2 = temp
        }
        let span = TimeInterval.random(in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }
    
}
