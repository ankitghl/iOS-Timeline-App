//
//  EventRowRenderer.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import SwiftUI

struct EventRowRenderer {
    
    @ViewBuilder
    static func view(for event: Event) -> some View {
        switch event.kind {
        case .noteAdded(let payload):
            TimelineRowView(
                icon: "note.text",
                title: payload.text,
                subtitle: "Note"
            )

        case .moodAdded(let payload):
            TimelineRowView(
                icon: "face.smiling",
                title: "Mood: \(payload.score)/5",
                subtitle: "Mood Logged"
            )

        case .focusStarted(let payload):
            TimelineRowView(
                icon: "timer",
                title: payload.intention ?? "Focus Started",
                subtitle: "Focus Session"
            )

        case .focusEnded(let payload):
            TimelineRowView(
                icon: "checkmark.circle",
                title: payload.completed ? "Completed" : "Stopped Early",
                subtitle: "Focus Session Ended"
            )
        }
    }
}
