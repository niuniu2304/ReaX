//
//  ContentView.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import SwiftUI
import SwiftData

/*
 TODO: Finish the GridView
 TODO: Finish the contentView with the best score, a timer, a play button(to start the game), the grid, and maybe a pause button on the bottom
 TODO: Make the logic for the contentView to work(start/stop button, play button).
 TODO: make grid view using a lazyVGrid(or something like that)
 TODO: add a button to go to the scoresView to view all the scores
 TODO: Finish the scoresView by adding a List(View) of all the previous scores and the best score on the top along side with when it was realised
 TODO:
 */

struct ContentView: View {

    @StateObject var gridViewModel: GridViewModel = GridViewModel()
    @State private var score: Int = 0

    @Environment(\.modelContext) private var modelContext
    @Query private var scores: [Scores]
    @State var isPlaying: Bool = false

    var body: some View {

        
        if isPlaying {
            
            PlayView()
            
        } else {
            HomeView(isPlaying: $isPlaying)
                .onAppear {
                    //Creates the first score so that the program doesn't crash
                    let score = Scores(timestamp: .now, score: 0)
                    modelContext.insert(score)
                }
        }
    }
    
    
    private func checkIfLose() -> Bool{
        return false
    }
    private func timer() {
        
    }
    private func updateGrid() {
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Scores.self, inMemory: true)
}
