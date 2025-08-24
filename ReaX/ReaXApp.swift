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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
