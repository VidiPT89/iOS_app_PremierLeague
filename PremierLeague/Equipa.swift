//
//  Equipa.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import Foundation

typealias Equipas = [Equipa]

// Estrutura que representa uma equipa de futebol, conforme os dados recebidos da API.
struct Equipa: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var shortName: String
    var tla: String
    var crest: String
    var founded: Int?
    var venue: String?
    var clubColors: String?
    var website: String?
}

// Estrutura para decodificar a resposta da API que contém a lista de equipas.
struct EquipasResposta: Codable {
    var teams: Equipas
}
