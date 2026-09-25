# PlanEat 🍽️

PlanEat is a Flutter app that generates real, existing recipes based on your
budget, cooking skill level, available time, number of servings, and the
ingredients you already have at home — using Google's Gemini API with web
search grounding to find and cost out actual published recipes (priced for
Sweden).

The app is not fully finished (yet)!

## Features

- **Personalized recipe input** — budget (SEK), skill level, cooking time,
  servings, and ingredients to include or already own
- **AI-grounded recipe search** — Gemini searches the web for real recipes
  matching your constraints rather than inventing them, and scales/estimates
  ingredient costs for you
- **Detailed recipe view** — ingredients, step-by-step instructions with
  checkboxes, cost and time breakdown
- **Favorites** — save recipes locally with Hive for offline access later
- **Light/dark theme**

## Tech stack

- [Flutter](https://flutter.dev) / Dart
- [Gemini API](https://ai.google.dev/) (`generateContent` with Google Search
  grounding + structured JSON output)
- [Hive CE](https://pub.dev/packages/hive_ce) for local persistence
- `http`, `cached_network_image`, `auto_size_text`

## Project structure

```
lib/
├── models/          # Recipe, Ingredient, CookingStep, UserInput
├── screens/         # HomeScreen, ResultsScreen, FavoritesScreen, DetailedRecipeScreen
├── services/        # LlmRecipeService, FavoritesService, MainNavigation
├── theme.dart
└── main.dart
```

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- A [Gemini API key](https://aistudio.google.com/apikey) from Google AI
  Studio

### Setup

1. Clone the repo and install dependencies:
   ```bash
   git clone https://github.com/<your-username>/planeat_mobile_app.git
   cd planeat_mobile_app
   flutter pub get
   ```

2. Create a `dart_define.json` file in the project root (this file is
   git-ignored — **never commit your real API key**):
   ```json
   {
     "GEMINI-API-KEY": "your-api-key-here"
   }
   ```
   See `dart_define.example.json` for a template.

3. Run the app with the define file loaded:
   ```bash
   flutter run --dart-define-from-file=dart_define.json
   ```

## Status

This project is under development.

- ✅ UI flow (input → results → recipe detail → favorites) is complete and
  functional with mock data.
- ✅ Local persistence (favorites) via Hive is implemented and working.
- 🚧 The Gemini-powered recipe generation (`LlmRecipeService`) is implemented
  but not yet fully verified end-to-end.

## License

[MIT](LICENSE)
