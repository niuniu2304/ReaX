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
                        Spacer()
                        Text("\(score.score)")
                            .font(.system(20, design: .rounded, weight: .bold))
                            .foregroundStyle(Color.mint)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .opacity(0.5)
                    }
                    .padding()
                }
            }
            .navigationTitle("Scores")
        } detail: {
            Text("Scores View")
        }
    }
}


#Preview {
    ScoresView()
        .modelContainer(for: Scores.self, inMemory: true)
}
