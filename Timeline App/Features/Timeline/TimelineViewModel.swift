//
//  TimelineViewModel.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import Foundation
import Observation

@Observable
final class TimelineViewModel {
    private let query: EventQuery
    
    private(set) var events: [Event] = []
    private(set) var isLoading: Bool = false
    
    private var offset = 0
    private var pageSize = 20
    
    init(query: EventQuery) {
        self.query = query
    }
    
    func loadInitial() {
        offset = 0
        events.removeAll()
        loadMore()
    }
    
    func loadMore() {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newEvents = try query.latest(limit: pageSize, offset: offset)
            events.append(contentsOf: newEvents)
            offset += newEvents.count
        } catch {
            
        }
        isLoading = false
    }
}
