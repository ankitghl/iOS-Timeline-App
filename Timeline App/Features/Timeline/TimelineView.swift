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
        self.vm = vm
    }
    
    var body: some View {
        List {
            ForEach(vm.events) { event in
                EventRowRenderer.view(for: event)
                    .onAppear {
                        if event == vm.events.last {
                            vm.loadMore()
                        }
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
