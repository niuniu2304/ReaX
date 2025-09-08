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
        NavigationStack {
            
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
                            
                            .foregroundStyle(Color.mint)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .opacity(0.5)
                    }
                    .padding()
                }
                .onDelete { indexSet in
                    for i in indexSet {
                        modelContext.delete(orderedScores[i])
                    }
                }
            }
            .navigationTitle("Scores")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                if !scores.isEmpty {
                    Button {
                        // Make an alert toggle the showalert variable and then from the alert delete everything
                        for score in (scores) {
                            modelContext.delete(score)
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                    }
                }
            }
            .overlay {
                if scores.isEmpty {
                    ContentUnavailableView(
                        "No Scores",
                        systemImage: "list.bullet.rectangle",
                        description: Text("Play to get your scores"))
                }
            }
        }
    }
}



#Preview {
    ScoresView()
        .modelContainer(for: Scores.self, inMemory: true)
}
