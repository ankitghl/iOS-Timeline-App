//
//  RelativeDataLabel.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import Foundation

struct RelativeDateLabel {
    
    static func title(for date: Date, calendar: Calendar = .current, now: Date = Date()) -> String {
        if calendar.isDate(date, inSameDayAs: now) {
            return "Today"
        }
        
        if let yesterday = calendar.date(byAdding: .day, value: -1, to: now),
            calendar.isDate(date, inSameDayAs: yesterday) {
            return "Yesterday"
        }
        
        if calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear) {
            return date.formatted(.dateTime.weekday())
        }
        
        return date.formatted(date: .abbreviated, time: .omitted)
        
    }
}
