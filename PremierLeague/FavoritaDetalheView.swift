//
//  FavoritaDetalheView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct FavoritaDetalheView: View {

    let favorita: EquipaFavorita

    var body: some View {
        List {

            // Seção de detalhes da equipa favorita, mostrando o escudo, nome e abreviatura
            Section {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        AsyncImage(url: URL(string: favorita.crest)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Image(systemName: "sportscourt.fill")
                                .resizable().scaledToFit()
                                .foregroundColor(.gray.opacity(0.3))
                        }
                        .frame(width: 100, height: 100)

                        Text(favorita.nome)
                            .font(.title2).fontWeight(.bold)
                            .multilineTextAlignment(.center)

                        Text(favorita.abreviatura)
                            .font(.subheadline).foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
            }

            // Seção de informações adicionais sobre a equipa favorita
            Section("Informações") {
                HStack {
                    Text("Estádio")
                    Spacer()
                    Text(favorita.estadio).foregroundColor(.secondary)
                }
                HStack {
                    Text("Guardada em")
                    Spacer()
                    Text(favorita.dataGuardado.formatted(date: .long, time: .omitted))
                        .foregroundColor(.secondary)
                }
            }

            // Seção para mostrar a avaliação pessoal da equipa favorita, representada por estrelas
            Section("A minha avaliação") {
                Text(String(repeating: "★", count: favorita.avaliacao)
                     + String(repeating: "☆", count: 5 - favorita.avaliacao))
                    .font(.title2).foregroundColor(.yellow)
            }

            // Seção para mostrar notas pessoais da equipa favorita, se houver
            if !favorita.nota.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Section("Notas pessoais") {
                    Text(favorita.nota).font(.body).lineSpacing(4)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(favorita.nome)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    EditarFavoritaView(favorita: favorita)
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}
