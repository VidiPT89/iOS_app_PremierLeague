//
//  APIHandler.swift
//  PremierLeague
//
//  Created by David Martins on 25/03/2026.
//
// API -> football-data.org v4

import Foundation

class APIHandler {

    static var shared = APIHandler(baseURL: "https://api.football-data.org/v4")

    var baseURL: URL
    let token = "43809d0b74814d279fa9c483dd588211"

    init(baseURL: String) {
        self.baseURL = URL(string: baseURL)!
    }

    // Cria URLRequest com o header de autenticação
    private func request(para url: URL) -> URLRequest {
        var req = URLRequest(url: url)
        req.setValue(token, forHTTPHeaderField: "X-Auth-Token")
        return req
    }

    // GET /v4/competitions/PL/teams
    func carregarEquipas() async -> Equipas {
        var url = baseURL
        url.appendPathComponent("competitions")
        url.appendPathComponent("PL")
        url.appendPathComponent("teams")

        let (data, _) = try! await URLSession.shared.data(for: request(para: url))
        let resposta = try! JSONDecoder().decode(EquipasResposta.self, from: data)
        return resposta.teams
    }

    // GET /v4/competitions/PL/standings
    func carregarClassificacao() async -> [LinhaClassificacao] {
        var url = baseURL
        url.appendPathComponent("competitions")
        url.appendPathComponent("PL")
        url.appendPathComponent("standings")

        let (data, _) = try! await URLSession.shared.data(for: request(para: url))
        let resposta = try! JSONDecoder().decode(ClassificacaoResposta.self, from: data)
        // Devolve a tabela TOTAL (índice 0)
        return resposta.standings.first(where: { $0.type == "TOTAL" })?.table ?? []
    }
}
