//
//  Timeline+Preview.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import Foundation

struct MockEventReader: EventReader {
    
    func events(from start: Date?, to end: Date?, limit: Int, offset: Int) throws -> [Event] {
        [
            EventFactory.note(
                text: "Read SwiftUI architecture notes",
                eventTime: Date().addingTimeInterval(-3600)
            ),
            EventFactory.mood(
                score: 4,
                eventTime: Date().addingTimeInterval(-1800)
            ),
            EventFactory.focusStarted(
                intention: "Work on timeline UI",
                eventTime: Date().addingTimeInterval(-900)
            ),
            EventFactory.focusEnded(
                completed: true,
                eventTime: Date()
            )
        ]
    }
}
