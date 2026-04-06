# 📱 Premier League iOS App

> Eleven players. One table. Zero excuses.

A SwiftUI app to follow the Premier League — browse teams, check the live standings, and manage your personal list of favourites with ratings and notes.

## What's inside
- Browse all 20 Premier League clubs with crest and home stadium
- Live league table with colour-coded qualification zones (Champions League, Europa League, Conference League, Relegation)
- Save favourite teams with a personal star rating (1–5) and custom notes
- Full team detail page: founded year, club colours, stadium, and official website
- Edit and delete favourites at any time
- Favourites sorted by most recently saved — because recency matters
- SwiftData persistence — your data survives app restarts
- MVVM architecture with `@Observable` (iOS 17+)
- Async/await networking with `URLSession`

## Tech Stack
`SwiftUI` | `SwiftData` | `Observation` | `URLSession` | `football-data.org API v4`

## Architecture

```
MVVM
├── Models       →  Equipa, Classificacao, EquipaFavorita
├── ViewModels   →  EquipasViewModel, ClassificacaoViewModel
├── Views        →  EquipasView, ClassificacaoView, FavoritasView + detail/row views
└── API          →  APIHandler (singleton)
```

## Screens

| Screen | Description |
|---|---|
| 🏟️ Teams | Full list of Premier League clubs |
| 📊 Standings | Live table with zone highlights |
| ⭐ Favourites | Your saved teams with ratings |
| 🔍 Team Detail | Club info, crest, website |
| ✏️ Edit Favourite | Update rating and personal notes |

## Honest notes
- All variable names and labels are in Portuguese. The Premier League is not. It works anyway.
- Error handling runs on `try!` throughout. It's brave. Refactoring is on the list.
- The API token is hardcoded in `APIHandler.swift`. It's a known issue. It will be addressed. Probably.
- First iOS project with real API integration and local persistent storage. SwiftData turned out to be surprisingly painless.
- Drag-to-reorder is set up in the Favourites list. The handler is empty. One step at a time.

## Requirements
- iOS 17+
- Xcode 15+
- API key from [football-data.org](https://www.football-data.org/client/register)

## Getting Started

```bash
git clone https://github.com/VidiPT89/iOS_app_PremierLeague.git
```

1. Open `PremierLeague.xcodeproj` in Xcode
2. Replace the token in `APIHandler.swift` with your own API key
3. Build and run on a simulator or iOS 17+ device

## Context
Built as part of my Mobile Development (iOS) module at CESAE Digital.
First SwiftUI project with live API data, navigation stacks, and persistent local storage.

*Next up: proper error handling. For real this time.*
