
<p align="center">
    <h1 align="center">SODA EFFECT IN FLUTTER</h1>
</p>

##  Overview

This project creates an animated soda-pouring effect in a Flutter application using a video that incorporates CSS for styling and animation. The goal was to recreate the fluid, smooth soda effect from a YouTube video demonstration, adapting it to a mobile environment using Flutter's powerful animation and widget system.
---
---

##  Repository Structure

```sh
└── lib/
    ├── Pages/
    │   ├── Widgets/
    │   │   ├── header.dart         # Header widget
    │   │   ├── hover_builder.dart  # Handles hover effect interactions
    │   │   ├── rocks.dart          # Rocks widget (customized feature)
    │   │   ├── soda.dart           # Soda-pouring animation logic
    │   │   └── main_page.dart      # Main page layout for the app
    ├── Providers/                  # State management or services (if any)
    ├── Utils/
    │   ├── constants/              # Constants for maintaining values
    │   ├── device/                 # Device-specific handling
    │   └── theme/
    │       └── theme.dart          # Custom themes for the app
    └── main.dart                   # App entry point
```


---

##  Project contents
* `main.dart` : The main entry point of the Flutter app.
* `soda.dart` : Handles the soda animation logic.
* `hover_builder.dart` : Adds hover functionality to the UI components.
---

##  Getting Started

***Requirements***

Ensure you have the following dependencies installed on your system:

* **Flutter**: `version 3.0.0 or higher`

###  Installation

1. Clone the Parking-Detection repository:

```sh
git clone https://github.com/BeeLTL/Soda-effect.git
```

2. Change to the project directory:

```sh
cd Soda-effect
```

###  Install the necessary dependencies:
```sh
flutter pub get
```

###  Running Soda Animation in Flutter:
```sh
flutter run
```

---





##  Resources

* `Video tutorial` : [Soda Animation Tutorial on YouTube](https://www.youtube.com/watch?v=ymuBowcODVU)


---



