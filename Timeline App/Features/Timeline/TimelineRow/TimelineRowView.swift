//
//  TimelineRowView.swift
//  Timeline App
//
//  Created by Ankit Gohel on 18/01/26.
//

import SwiftUI

struct TimelineRowView: View {
    
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.tint)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .foregroundStyle(.primary)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TimelineRowView(icon: "note.text", title: "Title", subtitle: "Subtitle")
}
