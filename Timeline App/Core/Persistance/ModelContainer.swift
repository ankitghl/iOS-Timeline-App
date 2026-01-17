//
//  ModelContainer.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation
import SwiftData

struct PersistentController {
    static func makeContainer() -> ModelContainer {
        let schema = Schema([Event.self])
        let configuration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema,
                                      configurations: [configuration])
        } catch {
            fatalError("Model container creation failed!!!")
        }
    }
}
