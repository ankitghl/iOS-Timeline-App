//
//  EventKind.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation

enum EventKind: Hashable, Codable {
    case noteAdded(NotePayload)
    case moodAdded(MoodPayload)
    case focusStarted(FocusStartPayload)
    case focusEnded(FocusEndPayload)
}
