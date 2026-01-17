//
//  Event.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation
import SwiftData

@Model
final class Event {
    
    @Attribute(.unique)
    var id: UUID
    
    var kindData: Data
    var eventTime: Date
    var recordedAt: Date
    var source: EventSource
    var tags:[String]
    
    init(id: EventID = EventID(), kind: EventKind, eventTime: Date, recordedAt: Date = Date(), source: EventSource, tags: [String] = []) {
        self.id = id.value
        self.kindData = try! JSONEncoder().encode(kind)
        self.eventTime = eventTime
        self.recordedAt = recordedAt
        self.source = source
        self.tags = tags
    }
    
    var kind: EventKind {
        try! JSONDecoder().decode(EventKind.self, from: kindData)
    }
}
