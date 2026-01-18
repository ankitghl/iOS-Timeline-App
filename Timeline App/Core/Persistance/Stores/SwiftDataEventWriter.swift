//
//  SwiftDataEventWriter.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation
import SwiftData

final class SwiftDataEventWriter: EventWriter {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func append(_ event: Event) throws {
        context.insert(event)
        try context.save()
    }
}
