//
//  ContentView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Equipas", systemImage: "sportscourt.fill") {
                EquipasView()
            }
            Tab("Favoritas", systemImage: "star.fill") {
                FavoritasView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: EquipaFavorita.self, inMemory: true)
}
