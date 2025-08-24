//
//  ScoresView.swift
//  ReaX
//
//  Created by Yao on 18/08/2025.
//

import SwiftUI
import SwiftData

struct ScoresView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    ScoresView()
}
