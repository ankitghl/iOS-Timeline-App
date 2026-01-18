//
//  TimelineView.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import SwiftUI

struct TimelineView: View {
    
    @State private var vm: TimelineViewModel
    
    init(vm: TimelineViewModel) {
        _vm = State(initialValue: vm)
    }
    
    var body: some View {
        List {
            ForEach(vm.dailySummaries) { summary in
                
                Section {
                    ForEach(summary.events) { event in
                        EventRowRenderer.view(for: event)
                    }
                } header: {
                    Text(summary.date, style: .date)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
            }
            
            if vm.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Timeline")
        .onAppear {
            vm.loadInitial()
        }
    }
}

#Preview {
    let reader = MockEventReader()
    let query = EventQuery(reader: reader)
    let vm = TimelineViewModel(query: query)
    
    NavigationStack {
        TimelineView(vm: vm)
    }
}
