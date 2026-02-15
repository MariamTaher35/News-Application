# News App

<div align="center">
  <p><strong>A comprehensive news aggregation platform delivering real-time Global news.</strong></p>
</div>

---

## 🎥 Demo

> **Note**: GitHub READMEs cannot directly play videos hosted on Google Drive. Please click the banner below to watch the demo.

<h3 align="center">
  <a href="https://drive.google.com/file/d/1Fn5T1LlikBWuopC303w_Qao0nZrNQeQX/view?usp=sharing">▶️ Click Here to Watch My Graduation Project Video</a>
</h3>

---

## ✨ Project Overview

This application is a dynamic news aggregation platform designed to keep users informed with real-time articles across various categories including **Sports, Business, Politics, Environment, Health, and Science**.

The project focuses on delivering a seamless and personalized user experience through a responsive interface and advanced features.

### 🚀 Key Features

*   **Real-time News Aggregation**: Integrates reliable APIs to fetch and display the latest news articles instantly across multiple categories.
*   **Bilingual Support**: Full support for **English** and **Arabic** languages with intuitive switching, ensuring accessibility for a wider audience.
*   **Advanced Capabilities**:
    *   **Smart Search**: Efficient search functionality to find specific articles or topics.
    *   **User Preferences**: Personalized settings to tailor the news feed to individual interests.
*   **Responsive Design**: A carefully crafted interface that provides a consistent and optimized experience across all mobile platforms and device sizes.

## 🛠️ Technology Stack

*   **Framework**: [Flutter](https://flutter.dev/)
*   **Language**: [Dart](https://dart.dev/)
*   **State Management**: [Provider](https://pub.dev/packages/provider)
*   **Networking**: [http](https://pub.dev/packages/http)
*   **Localization**: `flutter_localizations`, `intl`
*   **Utilities**: `url_launcher`

## 📂 Project Structure

```
lib/
├── core/            # Core utilities, themes, and network layer
├── generated/       # Generated localization files
├── l10n/            # Localization resources (Ar/En)
├── models/          # Data models for API responses
├── pages/           # Application screens and widgets
│   ├── home/        # Home screen and category news feeds
│   ├── setting/     # User preferences and settings
│   └── splash/      # Initial splash screen
└── main.dart        # Application entry point
```

## 🏁 Getting Started

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/news_app.git
    cd news_app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```
