//
//  Event.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation
import SwiftData

/// Event is an immutable, append-only fact.
/// Once persisted, it must never be mutated.
/// Corrections or changes are represented as new events.

@Model
final class Event {
    
    @Attribute(.unique)
    var id: UUID
    
    var kindData: Data
    var eventTime: Date ///When the event semantically occurred.
    var recordedAt: Date /// When this device observed the event. Must never be user-controlled.
    var source: EventSource
    var tags:[String]
    
    init(id: EventID = EventID(), kind: EventKind, eventTime: Date, recordedAt: Date = Date(), source: EventSource, tags: [String] = []) {
        self.id = id.value
        self.kindData = EventKindCodec.encode(kind)
        self.eventTime = eventTime
        self.recordedAt = recordedAt
        self.source = source
        self.tags = tags
    }
    
    var kind: EventKind {
        EventKindCodec.decode(kindData)
    }
    
}

