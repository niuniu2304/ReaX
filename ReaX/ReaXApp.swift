//
//  ReaXApp.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import SwiftUI
import SwiftData


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
    @StateObject var timerViewModel: TimerViewModel = TimerViewModel()

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
            .environmentObject(timerViewModel)
            
        }
        .modelContainer(sharedModelContainer)
    }
}
