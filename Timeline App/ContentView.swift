//
//  ContentView.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Text("Select an item")
    }
}

#Preview {
    ContentView()
}
