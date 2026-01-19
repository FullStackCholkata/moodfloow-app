# 🌊 MoodFlow

> *A minimalist mood tracking companion that flows with your day*

**MoodFlow** is a lightweight, always-accessible desktop mood tracker built with Flutter. It sits quietly in the corner of your screen, ready whenever you need to check in with yourself.

## ✨ Features

### 🎯 Current Implementation
- **Quick Mood Check-ins**: Select from 5 mood states with a single click
- **Personal Notes**: Add optional descriptions to contextualize your mood
- **Always Available**: Compact window that stays on top, positioned perfectly in the corner
- **Persistent Storage**: All entries saved locally using Drift (SQLite)
- **Clean Architecture**: Domain-driven design with proper separation of concerns

### 🚧 In Development
- Mood history visualization with charts
- Daily/weekly mood trends and insights
- Customizable check-in reminders
- Export mood data

## 🛠️ Tech Stack

- **Framework**: Flutter (Windows Desktop)
- **State Management**: Riverpod 2.6
- **Database**: Drift 2.28 (type-safe SQLite wrapper)
- **Architecture**: Clean Architecture with Repository Pattern
- **Window Management**: window_manager + screen_retriever

## 📁 Project Structure

```
lib/
├── main.dart
└── src/
    ├── core/
    │   └── widgets/           # Shared UI components
    └── features/
        └── mood/
            ├── domain/
            │   └── entities/  # Mood enum definition
            ├── data/
            │   ├── mood_database.dart
            │   └── mood_repository.dart
            └── presentation/
                ├── screens/   # Main mood flow screen
                └── widgets/   # Mood selector UI
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Windows 10/11

### Installation

```bash
# Clone the repository
git clone <your-repo-url>
cd mood_flow

# Install dependencies
flutter pub get

# Generate Drift database files
flutter pub run build_runner build

# Run the app
flutter run -d windows
```

## 🎨 Design Philosophy

MoodFlow embraces minimalism and accessibility:
- **Non-intrusive**: Small, corner-anchored window
- **Fast**: No friction between feeling and recording
- **Private**: All data stored locally, no cloud sync
- **Focused**: Does one thing well - tracking your emotional state

## 📊 Mood Scale

- 😞 **Very Bad**: Having a really tough time
- 😕 **Bad**: Things aren't going great
- 😐 **Neutral**: Just okay, neither good nor bad
- 🙂 **Good**: Feeling positive
- 😄 **Very Good**: Feeling great!

## 🤝 Contributing

This is proprietary software. Contributions are not accepted at this time.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Built with 💛 using Flutter*
