//
//  EquipasView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct EquipasView: View {

    @State var vm = EquipasViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query private var favoritas: [EquipaFavorita]

    // Corpo da View
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.equipas) { equipa in

                    // NavigationLink COM dados — passa a equipa
                    NavigationLink {
                        DetalheEquipaView(
                            equipa: equipa,
                            estaGuardada: estaGuardada(equipa.id),
                            aoToggleFavorito: { toggleFavorito(equipa) }
                        )
                    } label: {
                        EquipaRowView(equipa: equipa, isFavorita: estaGuardada(equipa.id))
                    }
                }
                .onDelete { offsets in
                    vm.equipas.remove(atOffsets: offsets)
                }
                .onMove { origem, destino in
                    vm.equipas.move(fromOffsets: origem, toOffset: destino)
                }
            }
            // Título e toolbar
            .navigationTitle("Premier League")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                // Navegação SEM dados — Classificação
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        ClassificacaoView()
                    } label: {
                        Image(systemName: "list.number")
                    }
                }
            }
            // Carrega dados ao aparecer — padrão do professor (Task como no didSet do 14)
            .onAppear {
                if vm.equipas.isEmpty {
                    Task { await vm.carregarEquipas() }
                }
            }
        }
    }

    // Favoritas (SwiftData)
    private func estaGuardada(_ id: Int) -> Bool {
        favoritas.contains { $0.equipaId == id }
    }

    // Busca a favorita correspondente à equipa, se existir
    private func favoritaExistente(_ id: Int) -> EquipaFavorita? {
        favoritas.first { $0.equipaId == id }
    }

    // Alterna o estado de favorito: se já existe, remove; se não existe, cria e guarda
    private func toggleFavorito(_ equipa: Equipa) {
        if let existente = favoritaExistente(equipa.id) {
            modelContext.delete(existente)
        } else {
            let nova = EquipaFavorita(
                equipaId:    equipa.id,
                nome:        equipa.name,
                abreviatura: equipa.tla,
                crest:       equipa.crest,
                estadio:     equipa.venue ?? "Desconhecido"
            )
            modelContext.insert(nova)
        }
    }
}

#Preview {
    EquipasView()
        .modelContainer(for: EquipaFavorita.self, inMemory: true)
}
