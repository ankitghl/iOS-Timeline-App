//
//  StaticEventReader.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation

struct StaticEventReader: EventReader {

    let events: [Event]

    func events(
        from start: Date?,
        to end: Date?,
        limit: Int,
        offset: Int
    ) throws -> [Event] {
        Array(events.dropFirst(offset).prefix(limit))
    }
}
