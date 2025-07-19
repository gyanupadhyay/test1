
---

## ✅ Why This Architecture?

This structure is designed to be:

- **Easy to maintain** and scale for medium-sized apps
- **Beginner-friendly** with clear responsibilities per layer
- **Testable**, with logic separated from UI
- Flexible enough to integrate third-party libraries, unit testing, and API handling

---

## 🧩 Key Technologies

- **Flutter** – Cross-platform UI toolkit
- **Bloc** – State management
- **GoRouter** – Declarative routing
- **Dio / HTTP / Hive** – For network requests or local data
- **Equatable** – For comparing Bloc states (optional but recommended)
- **GetIt** – Dependency injection

---

## 📁 Folder Details

| Folder        | Description |
|---------------|-------------|
| `bloc/`       | Manages state using Bloc (Events, States, Blocs) |
| `constants/`  | Global constants like strings, URLs, keys |
| `models/`     | Data models with `fromJson()` / `toJson()` if needed |
| `services/`   | Handles API calls, database interactions |
| `router/`     | All routes are defined here using GoRouter |
| `ui/`         | UI components and screens |
| `main.dart`   | Initializes dependencies and starts the app |

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
