//
//  ClassificacaoViewModel.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//

import Observation

@Observable
class ClassificacaoViewModel {

    var tabela: [LinhaClassificacao] = []
    var isLoading = false

    func carregarClassificacao() async {
        isLoading = true
        tabela = await APIHandler.shared.carregarClassificacao()
        isLoading = false
    }
}
