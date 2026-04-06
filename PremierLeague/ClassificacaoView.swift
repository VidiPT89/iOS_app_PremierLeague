//
//  ClassificacaoView.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftUI

struct ClassificacaoView: View {

    @State var vm = ClassificacaoViewModel()

    var body: some View {
        List {
            if !vm.tabela.isEmpty {
                // Cabeçalho
                HStack {
                    Text("Pos").frame(width: 30, alignment: .center)
                    Text("Equipa").frame(maxWidth: .infinity, alignment: .leading)
                    Text("J").frame(width: 28, alignment: .center)
                    Text("V").frame(width: 28, alignment: .center)
                    Text("E").frame(width: 28, alignment: .center)
                    Text("D").frame(width: 28, alignment: .center)
                    Text("Pts").frame(width: 36, alignment: .center)
                }
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .listRowBackground(Color.clear)

                // Linhas da classificação
                ForEach(vm.tabela) { linha in
                    HStack {
                        Text("\(linha.position)")
                            .frame(width: 30, alignment: .center)
                            .font(.subheadline)
                            .foregroundColor(corPosicao(linha.position))
                            .fontWeight(linha.position <= 4 ? .bold : .regular)

                        AsyncImage(url: URL(string: linha.team.crest)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Color.clear
                        }
                        .frame(width: 24, height: 24)

                        Text(linha.team.shortName)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)

                        Text("\(linha.playedGames)").frame(width: 28, alignment: .center).font(.subheadline)
                        Text("\(linha.won)").frame(width: 28, alignment: .center).font(.subheadline)
                        Text("\(linha.draw)").frame(width: 28, alignment: .center).font(.subheadline)
                        Text("\(linha.lost)").frame(width: 28, alignment: .center).font(.subheadline)
                        Text("\(linha.points)")
                            .frame(width: 36, alignment: .center)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .navigationTitle("Classificação PL")
        .navigationBarTitleDisplayMode(.large)
        .overlay {
            if vm.isLoading {
                ProgressView("A carregar...")
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
            }
        }
        .task { await vm.carregarClassificacao() }
    }

    // Define cores para as posições-chave da classificação
    private func corPosicao(_ pos: Int) -> Color {
        switch pos {
        case 1...4:  return .blue       // Champions League
        case 5:      return .orange     // Europa League
        case 6:      return .green      // Conference League
        case 18...20: return .red       // Descida
        default:     return .primary
        }
    }
}

#Preview {
    NavigationStack { ClassificacaoView() }
}
