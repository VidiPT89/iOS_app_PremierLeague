//
//  DetalheEquipaView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI

struct DetalheEquipaView: View {

    let equipa: Equipa
    @State private var estaGuardada: Bool
    let aoToggleFavorito: () -> Void

    init(equipa: Equipa, estaGuardada: Bool, aoToggleFavorito: @escaping () -> Void) {
        self.equipa = equipa
        self._estaGuardada = State(initialValue: estaGuardada)
        self.aoToggleFavorito = aoToggleFavorito
    }

    var body: some View {
        List {

            // Cabeçalho com logo, nome e sigla
            Section {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        AsyncImage(url: URL(string: equipa.crest)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Image(systemName: "sportscourt.fill")
                                .resizable().scaledToFit()
                                .foregroundColor(.gray.opacity(0.3))
                        }
                        .frame(width: 120, height: 120)

                        Text(equipa.name)
                            .font(.title2).fontWeight(.bold)
                            .multilineTextAlignment(.center)

                        Text(equipa.tla)
                            .font(.subheadline).foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
            }

            // Informações
            Section("Informações") {
                if let estadio = equipa.venue {
                    LabeledContent("Estádio", value: estadio)
                }
                if let fundado = equipa.founded {
                    LabeledContent("Fundado em", value: "\(fundado)")
                }
                if let cores = equipa.clubColors {
                    LabeledContent("Cores", value: cores)
                }
            }

            // Website
            if let site = equipa.website, let url = URL(string: site) {
                Section("Links") {
                    Link(destination: url) {
                        Label("Website oficial", systemImage: "globe")
                    }
                }
            }
        }
        // Estilo de lista para separar as secções
        .listStyle(.insetGrouped)
        .navigationTitle(equipa.shortName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Botão para guardar ou remover dos favoritos
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    estaGuardada.toggle()
                    aoToggleFavorito()
                } label: {
                    Image(systemName: estaGuardada ? "star.fill" : "star")
                        .foregroundColor(estaGuardada ? .yellow : .primary)
                }
            }
        }
    }
}
