# 📱 Netflix Clone - SwiftUI

![Swift](https://img.shields.io/badge/Swift-5.5-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-purple.svg)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-green.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

A sleek and modern Netflix clone built with SwiftUI, implementing core features of the Netflix mobile app while following best practices in iOS development.

## ✨ Features

- 🏠 **Home Screen** - Discover trending and popular content
- 🔍 **Search** - Find your favorite movies and TV shows
- ℹ️ **Detail View** - Comprehensive information about selected content
- 🔥 **New & Hot** - Stay updated with latest releases
- ⬇️ **Downloads** - Manage your downloaded content
- 🎬 **TMDB Integration** - Real-time movie and TV show data

## 🏗️ Architecture & Technical Stack

### Architecture
- ⚡️ MVVM (Model-View-ViewModel)
- 📱 SwiftUI for modern UI development
- 🔄 Clean and modular code structure

### Project Structure
```
Netflix/
├── 📱 App
├── 📂 Models
│   ├── Media
│   ├── Genre
│   └── TvShow
├── 📂 Views
│   ├── Home
│   ├── MovieDetail
│   ├── NewAndHot
│   ├── Search
│   ├── Components
│   └── Downloads
├── 📂 ViewModels
│   ├── HomeViewModel
│   ├── MovieDetailViewModel
│   ├── SearchViewModel
│   └── NewAndHotViewModel
├── 🛠️ Utilities
│   ├── NetworkManager
│   ├── HelperFunctions
│   └── Constants
└── 🗂️ Assets
```

## 🚀 Getting Started

### Prerequisites
- Xcode 13 or later
- iOS 15.0+
- Swift 5.5+
- TMDB API Key

### Installation
1. Clone the repository
```bash
git clone https://github.com/ShishirRijal/netflix-clone-swiftui.git
```

2. Navigate to project directory
```bash
cd netflix-clone-swiftui
```

3. Add your TMDB API key in `Utilities/Secrets.swift`
```swift
static let apiKey = "YOUR_API_KEY"
```

4. Open `Netflix.xcodeproj` and run the project

## 📱 Screenshots


Below are screenshots of the app on an iPhone 15 Pro.

|   |   |   |
|---|---|---|
| ![Screenshot 1](https://github.com/user-attachments/assets/682bc9ff-c27e-4cac-b231-eb96f319e6b0) | ![Screenshot 2](https://github.com/user-attachments/assets/f036dd34-39c5-4c79-8e9c-524f8f76fb6a) | ![Screenshot 3](https://github.com/user-attachments/assets/f5f9a95d-dc9a-4303-b4c3-3cf1e2fa0aa7) |
| ![Screenshot 4](https://github.com/user-attachments/assets/3dffd1d0-c5c5-4a98-b5f7-3ad59b98deb4) | ![Screenshot 5](https://github.com/user-attachments/assets/811f6753-9762-48b4-a11f-8d2394c0bf67) | ![Screenshot 6](https://github.com/user-attachments/assets/e055b30f-0244-4546-93d2-0d6f92585612) |
| ![Screenshot 7](https://github.com/user-attachments/assets/2ce087d1-63e9-4301-ad70-e39927dd84a5) | ![Screenshot 8](https://github.com/user-attachments/assets/f3652ae2-c411-41e5-80ad-a73904bebdcb) | ![Screenshot 9](https://github.com/user-attachments/assets/4558ef65-ef53-4496-99c5-d520679f7908) |
| ![Screenshot 10](https://github.com/user-attachments/assets/2215a97d-9fc9-4e00-8151-d7ce4fbdfb10) | ![Screenshot 11](https://github.com/user-attachments/assets/4460d2df-35b9-4924-8a6a-1f01fbc50c18) | ![Screenshot 12](https://github.com/user-attachments/assets/c325ac71-1e9f-4e19-9f24-b04a1275c0f9) |

## 🛠️ Technical Features

- 🏛️ MVVM Architecture for clean separation of concerns
- 🌐 API Integration with TMDB
- 🎨 Custom UI Components
- 🔄 Efficient Data Management
- 🔍 Search Functionality

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

- [TMDB](https://www.themoviedb.org/) for providing the API
- Netflix for inspiration
