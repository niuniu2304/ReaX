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
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(scores) { score in
                    HStack {
                        VStack() {
                            Text(score.timestamp.formatted(date: .numeric, time: .omitted))
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    ScoresView()
        .modelContainer(for: Scores.self, inMemory: true)
}
