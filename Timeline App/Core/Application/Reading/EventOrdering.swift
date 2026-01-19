//
//  EventOrdering.swift
//  Timeline App
//
//  Created by Ankit Gohel on 19/01/26.
//

import Foundation
import SwiftData

enum EventOrdering {
    static let sortDescriptors: [SortDescriptor<Event>] = [
        SortDescriptor(\.eventTime, order: .reverse),
        SortDescriptor(\.recordedAt, order: .reverse),
        SortDescriptor(\.id, order: .reverse)
    ]
}
