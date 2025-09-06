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
            
            // TODO: Make a ScrollView with rectangles of different size and color (for the 3 best Scores) Depending of the score And then make rectangles with the score the date and the time they took.
            let orderedScores = scores.sorted(by: { $0.score > $1.score })
            List {
                ForEach(orderedScores) { score in
                    HStack {
                        VStack() {
                            Text(score.timestamp.formatted(date: .numeric, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(score.time)
                        }
                        Text("\(score.score)")
                            .foregroundStyle(Color.mint)
                    }
                    .background {
                        Color.green
                            .opacity(0.5)
                    }
                }
            }
            .navigationTitle("Scores")
        } detail: {
            Text("Select an item")
        }
    }
}


#Preview {
    ScoresView()
        .modelContainer(for: Scores.self, inMemory: true)
}
