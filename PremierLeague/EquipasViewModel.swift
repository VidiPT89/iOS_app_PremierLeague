//
//  EquipasViewModel.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import Observation

@Observable
class EquipasViewModel {

    var equipas: Equipas = []
    var isLoading = false

    func carregarEquipas() async {
        isLoading = true
        equipas = await APIHandler.shared.carregarEquipas()
        isLoading = false
    }
}
