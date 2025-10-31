# Flutter Firebase MVVM Project

This is a **Flutter** project implementing **Firebase** authentication and product management using the **MVVM** architecture. The app provides a clean separation of UI, business logic, and data handling, ensuring maintainable and scalable code.

> ⚡ Note: All UI screens are designed in **Figma** and converted to Flutter. You can also watch the demo video [here](https://github.com/vikashbaria/Quick-Medical-Store-App/raw/refs/heads/main/App%20Features.mp4).

---

## 📱 Features

- **Splash Screen** – A beautiful splash screen while the app initializes.
- **Firebase Authentication**  
  - Sign Up using email and password  
  - Login with email and password  
- **Add Product** – Add new products to Firebase with details such as name, description, and price.
- **Show Products** – Display all products from Firebase dynamically.
- **Add to Cart** – Users can add products to the cart.
- **Profile Screen** – Displays user information like name and email fetched from Firebase.

---

## 🏗 Architecture

The project uses **MVVM (Model-View-ViewModel)** pattern:

- **Model** – Defines the data structure and Firebase operations.
- **View** – Flutter UI screens that observe the ViewModel for updates.
- **ViewModel** – Handles business logic, user interactions, and communicates with Firebase.

This separation ensures clean, maintainable, and testable code.

---

## ⚡ Screenshots

| Splash Screen 1 | Splash Screen 2 | Splash Screen 3 |
|----------------|----------------|----------------|
| ![Splash1](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/Splash1.png) | ![Splash2](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/Splash2.png) | ![Splash3](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/Splash3.png) |

| Sign In Screen | Home Screen | Top 4 Products on Home |
|----------------|------------|------------------------|
| ![SignIn](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/Signin.png) | ![Home](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/home.png) | ![TopProducts](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/top%204%20products%20on%20home%20page.png) |

| Product List Top | Product List Bottom | Add Product |
|-----------------|-------------------|------------|
| ![ProductTop](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/product%20top.png) | ![ProductBottom](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/product%20bottom.png) | ![AddToCart](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/Add%20to%20cart.png) |

| Profile Screen |
|----------------|
| ![Profile](https://raw.githubusercontent.com/vikashbaria/Quick-Medical-Store-App/refs/heads/main/App%20Images/profile.png) |

---

## 🎬 Demo Video

Watch the app in action: [App Features Video](https://github.com/vikashbaria/Quick-Medical-Store-App/raw/refs/heads/main/App%20Features.mp4)

---

## 🔧 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Firebase account
- Android Studio or VS Code

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/Quick-Medical-Store-App.git
cd Quick-Medical-Store-App
