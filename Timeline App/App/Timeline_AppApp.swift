//
//  Timeline_AppApp.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import SwiftUI
import SwiftData

@main
struct Timeline_AppApp: App {
    var container = PersistentController.makeContainer()
    
    init() {
        let context = ModelContext(container)
        let writer = SwiftDataEventWriter(context: context)
        let reader = SwiftDataEventReader(context: context)
        let query = EventQuery(reader: reader)
        
        let event1 = EventFactory.note(
            text: "Morning note",
            eventTime: Date().addingTimeInterval(-3600)
        )

        let event2 = EventFactory.mood(
            score: 4,
            eventTime: Date()
        )


        try? writer.append(event1)
        try? writer.append(event2)
        
        let latest = try? query.latest(limit: 10)
        print("Fetched events:", latest?.count ?? 0)
    }
    
    var body: some Scene {
        WindowGroup {
            Text("Phase 0 Write Path Ready")
        }
        .modelContainer(container)
    }
}
