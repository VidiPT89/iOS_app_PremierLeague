//
//  EquipaRowView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI

struct EquipaRowView: View {

    let equipa: Equipa
    let isFavorita: Bool

    // Corpo da vista que representa uma linha de equipa
    var body: some View {
        HStack(spacing: 12) {

            // Logo da equipa
            AsyncImage(url: URL(string: equipa.crest)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Image(systemName: "sportscourt.fill")
                    .foregroundColor(.gray.opacity(0.3))
            }
            .frame(width: 44, height: 44)

            // Nome da equipa e estádio (se disponível)
            VStack(alignment: .leading, spacing: 3) {
                Text(equipa.name).font(.headline).lineLimit(1)
                if let estadio = equipa.venue {
                    Text(estadio).font(.caption).foregroundColor(.secondary).lineLimit(1)
                }
            }

            Spacer()

            // Ícone de estrela preenchida se a equipa for favorita
            if isFavorita {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}
