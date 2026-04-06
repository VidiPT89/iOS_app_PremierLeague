//
//  FavoritasView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct FavoritasView: View {

    @Query(sort: \EquipaFavorita.dataGuardado, order: .reverse)
    private var favoritas: [EquipaFavorita]

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            List {
                ForEach(favoritas) { fav in

                    // NavigationLink COM dados — passa a favorita
                    NavigationLink {
                        FavoritaDetalheView(favorita: fav)
                    } label: {
                        FavoritaRowView(favorita: fav)
                    }
                }
                .onDelete { offsets in
                    for index in offsets {
                        modelContext.delete(favoritas[index])
                    }
                }
                .onMove { origem, destino in
                }
            }
            .navigationTitle("Favoritas")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    FavoritasView()
        .modelContainer(for: EquipaFavorita.self, inMemory: true)
}
