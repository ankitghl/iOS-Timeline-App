//
//  TimelinePreviewFactory.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation

enum TimelinePreviewFactory {
    
    static func makeViewModel(events: [Event] = EventPreviewData.smallTimeline()) -> TimelineViewModel {
        let reader = StaticEventReader(events: events)
        let query = EventQuery(reader: reader)
        return TimelineViewModel(query: query)
    }
}
