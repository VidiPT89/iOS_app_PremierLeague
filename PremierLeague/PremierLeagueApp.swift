//
//  PremierLeagueApp.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

@main
struct PremierLeagueApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([EquipaFavorita.self])
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
