//
//  DateExtensions.swift
//  Birthday Tracker
//
//  Created by Edward Zhou on 9/1/24.
//

import Foundation

// extend Date to get current month dates
extension Date{
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // get start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)! // get days in current month
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
    
    func getMonthName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }
    
    func todayEarlierThan(date: Date) -> Bool {
        let delta1 = self.timeIntervalSince(date)
        if (delta1 < 0) {
            return false
        }
        return true
    }
    
    func monthsFrom(from date: Date) -> Int {
        let i:Int = Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
        return i
    }

    func daysFrom(from date: Date) -> Int {
        let i:Int = Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
        return i
    }
    
    func removeTimeStamp() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
}
