# antripe_task

A new Flutter project.

## Getting Started
# Flutter Application

A scalable Flutter application built using modern architecture principles and best practices.  
The project is structured for maintainability, performance, and future extensibility.

---

## Flutter Version

Flutter 3.38.3

To verify your version:

flutter --version

---

## Setup Instructions

1. Clone the repository

git clone <repository-url>
cd <project-folder>

2. Install dependencies

flutter pub get

3. Verify environment

flutter doctor

Make sure there are no critical issues before running the project.

---

## How to Run the Application

Run on emulator or physical device:

flutter run

Run on specific device:

flutter devices
flutter run -d <device_id>

Build Android release APK:

flutter build apk --release

Build iOS release:

flutter build ios --release

---

## Dependencies Used (pubspec.yaml)

google_fonts: ^6.3.2  
flutter_svg: ^2.2.1  
flutter_bloc: ^9.1.1  
equatable: ^2.0.8   
dio: ^5.9.1

---

## Libraries & Purpose

- google_fonts → Custom typography integration
- flutter_svg → SVG asset rendering
- flutter_bloc → State management
- equatable → Value equality for state comparison
- dio → HTTP client for API communication

---

## Assumptions Made

- Flutter SDK version is strictly 3.38.3
- Null safety is enabled
- The application supports Android and iOS
- Backend communication is REST-based
- Network layer is implemented using Dio
- Project follows a feature-based folder structure
- Business logic is separated from UI layer
- SVG assets are optimized before use

---

## Project Structure

lib/
├── app/  
├── core/              # Shared utilities and configurations
├── features/          # Feature-based modules
│   ├── data/
│   │
│   └── presentation/
│
└── main.dart

---

## Best Practices Followed

- Clean separation of concerns
- Modular feature-based architecture
- Reusable components
- Centralized network configuration
- Scalable state management
- Consistent code structure
- Maintainable and extensible design

---

## Troubleshooting

If dependency issues occur:

flutter clean
flutter pub get

If build issues occur:

flutter clean
flutter pub cache repair

---

Flutter Version: 3.38.3

