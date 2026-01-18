//
//  EventQuery.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import Foundation

struct EventQuery {
    let reader: EventReader
    
    func latest(limit: Int, offset: Int = 0) throws -> [Event] {
        try reader.events(from: nil, to: nil, limit: limit, offset: offset)
    }
    
    func between(start: Date, end: Date, limit: Int, offset: Int = 0) throws -> [Event] {
        try reader.events(from: start, to: end, limit: limit, offset: offset)
    }
    
    func dailySummaries(limit: Int, offset: Int = 0, calendar: Calendar = .current) throws -> [DailyEventSummary] {
        let events = try latest(limit: limit, offset: offset)
        
        let grouped = Dictionary(grouping: events) { event in
            calendar.startOfDay(for: event.eventTime)
        }
        
        return grouped
            .map { DailyEventSummary(date: $0.key, events: $0.value) }
            .sorted{ $0.date > $1.date }
    }
}
