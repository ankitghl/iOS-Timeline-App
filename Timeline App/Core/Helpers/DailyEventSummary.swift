//
//  DailyEventSummary.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import Foundation

struct DailyEventSummary: Identifiable {
    let date: Date
    let events: [Event]
    
    var id: Date { date }
    
    var eventCount: Int { events.count }
}
