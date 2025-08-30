//
//  ContentView.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import SwiftUI
import SwiftData

/*
 TODO: Make the logic for the contentView to work(start/stop button, play button).
 TODO: Finish the scoresView by adding a List(View) of all the previous scores and the best score on the top along side with when it was realised
 TODO: Finish the life feature 3 life for each time we got one wrong we substract one life
 TODO: Finish the gameOverView
 */

struct ContentView: View {

    
    @State var isPlaying: Bool = false

    var body: some View {
        if isPlaying {
            PlayView(isPlaying: $isPlaying)
        } else {
            HomeView(isPlaying: $isPlaying)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Scores.self, inMemory: true)
}
