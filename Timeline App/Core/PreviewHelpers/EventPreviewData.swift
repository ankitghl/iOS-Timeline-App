//
//  EventPreviewData.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation

enum EventPreviewData {

    static func smallTimeline() -> [Event] {
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

    static func denseDay() -> [Event] {
        (0..<20).map {
            EventFactory.note(
                text: "Note \($0)",
                eventTime: Date().addingTimeInterval(TimeInterval(-$0 * 300))
            )
        }
    }
}
