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
    
    private(set) var dailySummaries: [DailyEventSummary] = []
    private(set) var isLoading: Bool = false
    
    private var offset = 0
    private var pageSize = 50
    
    init(query: EventQuery) {
        self.query = query
    }
    
    func loadInitial() {
        offset = 0
        dailySummaries.removeAll()
        loadMore()
    }
    
    func loadMore() {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newSummaries = try query.dailySummaries(limit: pageSize, offset: offset)
            dailySummaries.append(contentsOf: newSummaries)
            offset += pageSize
        } catch {
            
        }
        isLoading = false
    }
}
