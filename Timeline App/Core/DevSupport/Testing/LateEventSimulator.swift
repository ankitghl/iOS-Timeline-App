//
//  LateEventSimulator.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation
import SwiftData

#if DEBUG
enum LateEventSimulator {
    static func insertLateEvent(context: ModelContext, daysInPast: Int) {
        let lateDate = Calendar.current.date(byAdding: .day, value: -daysInPast, to: Date())!
        let event = EventFactory.note(
            text: "⚠️ Late event from \(daysInPast) days ago",
            eventTime: lateDate,
            source: .import
        )

        let writer = SwiftDataEventWriter(context: context)
        try? writer.append(event)
    }
}
#endif
