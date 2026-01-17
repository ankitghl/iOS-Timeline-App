//
//  EventFactory.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation

struct EventFactory {
    
    static func note(text: String, eventTime: Date = Date(), source: EventSource = .manual, tags: [String] = []) -> Event {
        Event(
            kind: .noteAdded(NotePayload(text: text)),
              eventTime: eventTime,
              source: source,
              tags: tags
        )
    }
    
    static func mood(score: Int, eventTime: Date = Date(), source: EventSource = .manual, tags: [String] = []) -> Event {
        Event(
            kind: .moodAdded(MoodPayload(score: score)),
            eventTime: eventTime,
            source: source,
            tags: tags
        )
    }

    static func focusStarted(intention: String?, eventTime: Date = Date(), source: EventSource = .manual, tags: [String] = []) -> Event {
        Event(
            kind: .focusStarted(FocusStartPayload(intention: intention)),
            eventTime: eventTime,
            source: source,
            tags: tags
        )
    }

    static func focusEnded(completed: Bool, eventTime: Date = Date(), source: EventSource = .manual, tags: [String] = []) -> Event {
        Event(
            kind: .focusEnded(FocusEndPayload(completed: completed)),
            eventTime: eventTime,
            source: source,
            tags: tags
        )
    }

}
