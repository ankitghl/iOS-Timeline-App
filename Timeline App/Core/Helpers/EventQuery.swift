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
}
