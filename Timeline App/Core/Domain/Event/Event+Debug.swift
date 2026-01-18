//
//  Event+Debig.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation

#if DEBUG
extension Event {
    
    var debigSummary: String {
        switch kind {
        case .noteAdded(let payload):
            return "📝 Note: \(payload.text)"
        case .moodAdded(let payload):
            return "🙂 Mood: \(payload.score)"
        case .focusStarted:
            return "⏱ Focus Started"
        case .focusEnded(let payload):
            return payload.completed ? "✅ Focus Completed" : "⛔ Focus Stopped"

        }
    }
}
#endif
