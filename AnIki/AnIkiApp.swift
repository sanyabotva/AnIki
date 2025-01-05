//
//  AnIkiApp.swift
//  AnIki
//
//  Created by Timur Baiazitov on 30.12.2024.
//

import SwiftUI
import SwiftData

@main
struct AnIkiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Deck.self,
            Card.self
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
