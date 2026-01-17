//
//  SwiftDataEventReader.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation
import SwiftData

final class SwiftDataEventReader: EventReader {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func events(from start: Date?, to end: Date?, limit: Int, offset: Int) throws -> [Event] {
        var predicate: Predicate<Event>? = nil
        
        if let start, let end {
            predicate = #Predicate<Event> {
                $0.eventTime >= start && $0.eventTime < end
            }
        } else if let start {
            predicate = #Predicate<Event> {
                $0.eventTime >= start
            }
        } else if let end {
            predicate = #Predicate<Event> {
                $0.eventTime < end
            }
        }
        
        let descriptor = FetchDescriptor<Event>(predicate: predicate, sortBy: [
            SortDescriptor(\.eventTime, order: .reverse),
            SortDescriptor(\.recordedAt, order: .reverse)
        ]
        )
        
        var fetchDescriptor = descriptor
        fetchDescriptor.fetchLimit = limit
        fetchDescriptor.fetchOffset = offset
        
        return try context.fetch(fetchDescriptor)
    }

}
