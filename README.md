# Premier League iOS App

Aplicação iOS para acompanhar a **Premier League**, desenvolvida em SwiftUI com arquitetura MVVM.

## Funcionalidades

- **Equipas** — Lista todas as 20 equipas da Premier League com escudo e estádio
- **Classificação** — Tabela em tempo real com zonas coloridas (Champions League, Europa League, Descida)
- **Favoritas** — Guarda equipas favoritas com avaliação por estrelas e notas pessoais
- **Detalhe de Equipa** — Informações completas: estádio, ano de fundação, cores, website

## Tecnologias

| Tecnologia | Uso |
|---|---|
| SwiftUI | Interface declarativa |
| SwiftData | Persistência local (favoritas) |
| Observation (`@Observable`) | Gestão de estado (iOS 17+) |
| URLSession (async/await) | Chamadas à API |
| [football-data.org v4](https://www.football-data.org/) | Dados da Premier League |

## Arquitetura

```
MVVM
├── Models       → Equipa, Classificacao, EquipaFavorita
├── ViewModels   → EquipasViewModel, ClassificacaoViewModel
├── Views        → EquipasView, ClassificacaoView, FavoritasView, ...
└── API          → APIHandler (singleton)
```

## Estrutura do Projeto

```
PremierLeague/
├── APIHandler.swift
├── Equipa.swift
├── Classificacao.swift
├── EquipaFavorita.swift
├── EquipasViewModel.swift
├── ClassificacaoViewModel.swift
├── ContentView.swift
├── EquipasView.swift
├── EquipaRowView.swift
├── DetalheEquipaView.swift
├── ClassificacaoView.swift
├── FavoritasView.swift
├── FavoritaRowView.swift
├── FavoritaDetalheView.swift
└── EditarFavoritaView.swift
```

## Requisitos

- iOS 17+
- Xcode 15+
- Chave de API: [football-data.org](https://www.football-data.org/client/register)

## Instalação

1. Clona o repositório:
   ```bash
   git clone https://github.com/VidiPT89/iOS_app_PremierLeague.git
   ```
2. Abre `PremierLeague.xcodeproj` no Xcode
3. Substitui o token em `APIHandler.swift` pela tua chave de API
4. Compila e executa num simulador ou dispositivo iOS 17+

## Autor

David Martins — CESAE Digital, 2026
