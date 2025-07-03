# 🚀 SpaceNewsApp

**SpaceNewsApp** is an iOS application that displays the latest space-related news using the [Spaceflight News API](https://api.spaceflightnewsapi.net/). It is built using the **MVC architecture** and includes features like search, pagination, empty state handling, and pull to refresh.

---

## 💡 Features

- 🔍 Search articles by title or summary using live API queries  
- 📄 Infinite scrolling with pagination support  
- 🔄 Pull to refresh to reload latest articles  
- 🌙 Dark & Light mode support  
- 🚫 Graceful empty state handling using `UIContentUnavailableConfiguration`  
- ⚙️ Fully modular, clean architecture using MVC  

---

## 🧠 Architecture

The app uses **Model-View-Controller (MVC)**:

- **Model:**  
  - Codable structs like `Article`, `ArticleResponse`, and `ErrorMessage`
- **View:**  
  - UIKit with storyboard-based `UITableViewController` and a custom `UITableViewCell`
- **Controller:**  
  - Handles all logic (search, pagination, refresh, error handling)  
  - Integrates with a reusable network layer

---

## 🌐 Network Layer

- Built with **Alamofire**
- Uses a generic `BaseAPI` for fetching any `Decodable` type
- Structured with `TargetType` for modular endpoints
- Error handling is unified via `Result` and custom error messages

---

## 🛠 Tech Stack

- **Swift** + **UIKit**
- **MVC Architecture**
- **Alamofire** – for networking
- **Kingfisher** – for image downloading & caching
- **UISearchController** – for searching
- **UIRefreshControl** – for pull to refresh
- **UIContentUnavailableConfiguration** – for empty states

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/Rana2113/SpaceNewsApp.git