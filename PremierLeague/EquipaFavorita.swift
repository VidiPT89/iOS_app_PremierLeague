//
//  EquipaFavorita.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import SwiftData
import Foundation

// Modelo de dados para uma equipa favorita, que será armazenada usando SwiftData
@Model
class EquipaFavorita {
    var equipaId: Int
    var nome: String
    var abreviatura: String
    var crest: String
    var estadio: String
    var nota: String
    var avaliacao: Int
    var dataGuardado: Date

    init(equipaId: Int, nome: String, abreviatura: String, crest: String,
         estadio: String, nota: String = "", avaliacao: Int = 3) {
        self.equipaId    = equipaId
        self.nome        = nome
        self.abreviatura = abreviatura
        self.crest       = crest
        self.estadio     = estadio
        self.nota        = nota
        self.avaliacao   = avaliacao
        self.dataGuardado = Date()
    }
}
