//
//  FavoritaRowView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct FavoritaRowView: View {

    let favorita: EquipaFavorita

    var body: some View {
        HStack(spacing: 12) {

            // Logo da equipa favorita
            AsyncImage(url: URL(string: favorita.crest)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Image(systemName: "sportscourt.fill")
                    .foregroundColor(.gray.opacity(0.3))
            }
            .frame(width: 44, height: 44)

            // Nome da equipa favorita, avaliação em estrelas e nota pessoal (se disponível)
            VStack(alignment: .leading, spacing: 3) {
                Text(favorita.nome).font(.headline).lineLimit(1)
                Text(String(repeating: "★", count: favorita.avaliacao)
                     + String(repeating: "☆", count: 5 - favorita.avaliacao))
                    .font(.subheadline).foregroundColor(.yellow)
                if !favorita.nota.isEmpty {
                    Text(favorita.nota)
                        .font(.caption).foregroundColor(.secondary).lineLimit(1)
                }
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}
