//
//  Classificacao.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import Foundation

struct ClassificacaoResposta: Codable {
    var standings: [GrupoClassificacao]
}

struct GrupoClassificacao: Codable {
    var type: String
    var table: [LinhaClassificacao]
}

struct LinhaClassificacao: Codable, Identifiable {
    var position: Int
    var team: EquipaMinima
    var playedGames: Int
    var won: Int
    var draw: Int
    var lost: Int
    var points: Int
    var goalsFor: Int
    var goalsAgainst: Int
    var goalDifference: Int

    var id: Int { team.id }
}

struct EquipaMinima: Codable {
    var id: Int
    var name: String
    var shortName: String
    var tla: String
    var crest: String
}
