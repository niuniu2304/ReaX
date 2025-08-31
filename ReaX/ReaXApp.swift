//
//  ReaXApp.swift
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

@main
struct ReaXApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Scores.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @State var isPlaying: Bool = false
    @StateObject var gridViewModel: GridViewModel = GridViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isPlaying {
                    PlayView(isPlaying: $isPlaying)
                } else {
                    HomeView(isPlaying: $isPlaying)
                }
            }
            .environmentObject(gridViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
