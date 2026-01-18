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
                    Text( RelativeDateLabel.title(for: summary.date) )
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

#Preview("Normal Timeline") {
    NavigationStack {
        TimelineView(
            vm: TimelinePreviewFactory.makeViewModel()
        )
    }
}

#Preview("Dense Day") {
    NavigationStack {
        TimelineView(
            vm: TimelinePreviewFactory.makeViewModel(
                events: EventPreviewData.denseDay()
            )
        )
    }
}
