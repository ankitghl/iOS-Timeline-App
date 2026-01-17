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
        
        let event = EventFactory.note(text: "First event 🎉")
        
        try? writer.append(event)
    }
    
    var body: some Scene {
        WindowGroup {
            Text("Phase 0 Write Path Ready")
        }
        .modelContainer(container)
    }
}
