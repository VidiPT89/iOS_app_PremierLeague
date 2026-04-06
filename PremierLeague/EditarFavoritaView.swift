//
//  EditarFavoritaView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI
import SwiftData

struct EditarFavoritaView: View {

    let favorita: EquipaFavorita

    @State private var nota: String = ""
    @State private var avaliacao: Int = 3

    var body: some View {
        Form {

            // Mostrar detalhes da equipa (apenas para referência, não editável)
            Section("Equipa") {
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: favorita.crest)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Image(systemName: "sportscourt.fill")
                            .foregroundColor(.gray.opacity(0.4))
                    }
                    .frame(width: 50, height: 50)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(favorita.nome).font(.headline)
                        Text(favorita.estadio).font(.subheadline).foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }

            // Avaliação — pode ser editada
            Section("A minha avaliação") {
                Picker("Avaliação", selection: $avaliacao) {
                    ForEach(1...5, id: \.self) { n in
                        Text(String(repeating: "★", count: n)).tag(n)
                    }
                }
                .pickerStyle(.segmented)
            }

            // Notas pessoais — pode ser editada
            Section("Notas pessoais") {
                TextEditor(text: $nota)
                    .frame(minHeight: 100)
            }

            Section {
                // Guardar — modifica o @Model directamente (SwiftData auto-guarda)
                Button("Guardar") {
                    favorita.nota      = nota
                    favorita.avaliacao = avaliacao
                }
                .fontWeight(.semibold)
            }
        }
        // O título e estilo da navegação
        .navigationTitle("Editar Favorita")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            nota      = favorita.nota
            avaliacao = favorita.avaliacao
        }
    }
}
