# Union Shop — Flutter E-Commerce Application

A Flutter-based recreation of the University of Portsmouth Students' Union shop ([shop.upsu.net](https://shop.upsu.net)), developed as coursework for **Programming Applications and Programming Languages (M30235)** and **User Experience Design and Implementation (M32605)**.

---

## 📱 Overview

This application is a mobile-first e-commerce platform that replicates the functionality of the UPSU shop website. Built with Flutter, it demonstrates key mobile development concepts including multi-page navigation, state management, responsive design, and comprehensive testing.

The application uses hardcoded sample data to simulate a product catalog, shopping cart, and user interactions without requiring backend services.

### ✨ Key Features

- **Product Catalog** — Browse featured products with images, prices, and descriptions
- **Collections System** — Organized product collections (Autumn Favourites, Winter Warmers, Spring Selection)
- **Shopping Cart** — Full cart management with add/remove items, quantity control, and price calculations
- **Sale Page** — Dedicated page showcasing discounted products
- **Personalisation Service** — Custom text printing form (Print Shack) with dynamic input handling
- **Multi-page Navigation** — Complete routing system with URL-based navigation between pages
- **Responsive Design** — Mobile-first layout with desktop breakpoints
- **Modern UI** — Clean interface following UPSU branding with smooth animations
- **Test Coverage** — 70+ test cases covering widgets, services, and models

---

## 🚀 Quick Start

### Prerequisites

Ensure you have Flutter installed on your system. Verify your installation:

```bash
flutter doctor
```

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/YOUR-USERNAME/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**

   ```bash
   flutter run -d chrome
   ```

### Viewing in Mobile Mode

This application is designed for **mobile-first** viewing:

1. Once running in Chrome, press `F12` to open DevTools
2. Click the "Toggle device toolbar" button (or press `Ctrl+Shift+M`)
3. Select a mobile device preset (e.g., iPhone 12 Pro, Pixel 5)

The app is fully responsive and also works on desktop screens.

## 🏗️ Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                    # Main application entry point and home page
│   ├── app_header.dart              # Reusable header/navbar component
│   ├── app_footer.dart              # Footer component with links
│   ├── about_page.dart              # About Us page
│   ├── about_print_shack.dart       # Print Shack information page
│   ├── cart_page.dart               # Shopping cart page
│   ├── collection_page.dart         # Single collection view
│   ├── collections_page.dart        # All collections view
│   ├── personalisation_page.dart    # Text personalization service
│   ├── product_page.dart            # Product detail page
│   ├── sale_page.dart               # Sale items page
│   ├── sign_in_page.dart            # Authentication UI (static)
│   ├── data/
│   │   └── sample_data.dart         # Hardcoded sample product data
│   ├── models/
│   │   ├── cart_item.dart           # Cart item data model
│   │   ├── collection.dart          # Collection data model
│   │   └── product.dart             # Product data model
│   └── services/
│       └── cart_service.dart        # Cart state management service
│
├── test/
│   ├── home_test.dart               # Home page widget tests (12 tests)
│   ├── product_test.dart            # Product page widget tests (14 tests)
│   ├── cart_page_test.dart          # Cart page widget tests (10 tests)
│   ├── cart_service_test.dart       # Cart service unit tests (14 tests)
│   ├── models/
│   │   ├── product_test.dart        # Product model tests (7 tests)
│   │   └── cart_item_test.dart      # Cart item model tests (10 tests)
│   └── widgets/
│       └── app_header_test.dart     # Header widget tests (10 tests)
│
├── run_tests.ps1                    # PowerShell test runner script
├── TEST_COMMANDS.md                 # Test commands reference
├── pubspec.yaml                     # Project dependencies
└── README.md                        # This file
```

---

## 🛠️ Technologies & Architecture

### Frontend Framework
- **Flutter** (v3.x) - Cross-platform UI framework
- **Dart** (v3.x) - Programming language

### State Management
- **ChangeNotifier** - Built-in Flutter state management for cart service
- **ValueNotifier** - Lightweight state management for reactive updates

### Architecture Pattern
- **Service-oriented architecture** with separation of concerns:
  - **Models**: Data classes (`Product`, `CartItem`, `Collection`)
  - **Services**: Business logic (`CartService`)
  - **UI**: Widget-based presentation layer
  - **Data**: Centralized sample data management

### Testing
- **flutter_test** package for widget and unit tests
- **70+ test cases** covering:
  - Widget rendering and interaction
  - Business logic and state management
  - Data models and calculations
  - User flows and edge cases

### Key Packages
- `flutter` — Core framework
- `flutter_test` — Testing utilities

---

## 🧪 Testing

The project includes a test suite with 70+ test cases covering widgets, services, and models.

### Run All Tests

**Option 1: Using PowerShell Script (Windows)**
```bash
.\run_tests.ps1
```

**Option 2: Using Flutter Command**
```bash
flutter test
```

### Run Specific Tests

```bash
# Run tests for a specific file
flutter test test/cart_service_test.dart

# Run tests with verbose output
flutter test --reporter expanded

# Run tests in watch mode (re-run on file changes)
flutter test --watch
```

### Test Coverage

- **Home Page**: Banner, hero section, product cards, navigation
- **Product Page**: Display, quantity selector, add to cart, null handling
- **Cart Service**: Add/remove items, quantities, price calculations, listeners
- **Cart Page**: Empty state, item display, checkout, removal
- **Models**: Product validation, cart item calculations
- **Widgets**: Header navigation, icons, tooltips, callbacks

For more testing commands, see [`TEST_COMMANDS.md`](TEST_COMMANDS.md).

---

## 📱 Features Implemented

### ✅ Basic Features (40%)
- ✓ Static Homepage with hero section and featured products
- ✓ Responsive navigation bar with mobile menu
- ✓ About Us page with company information
- ✓ Footer with links and information
- ✓ Collections page displaying multiple product collections
- ✓ Individual collection pages with product listings
- ✓ Product detail pages with images and descriptions
- ✓ Sale page with discounted products
- ✓ Sign-in page UI (authentication forms)

### ✅ Intermediate Features (35%)
- ✓ Full multi-page navigation with URL routing
- ✓ Dynamic collections populated from data models
- ✓ Dynamic collection pages with product data
- ✓ Functional product pages with quantity selectors
- ✓ Shopping cart with add/view functionality
- ✓ Print Shack personalization page with dynamic form
- ✓ Responsive layout (mobile and desktop support)

### ✅ Advanced Features (25%)
- ✓ Full cart management (quantity editing, removal, calculations)
- ⏳ Authentication system (UI only, no backend implementation)
- ⏳ Search functionality (not implemented)

---

## 🎨 Design Features

- **Mobile-first responsive design** with breakpoints for desktop
- **UPSU color scheme** and branding consistency
- **Smooth animations** and transitions
- **Accessible UI** with proper contrast and touch targets
- **Clean, modern interface** optimized for user experience

---

## 📝 Development Practices

### Git Workflow
- Regular, small, meaningful commits throughout development
- Clear commit messages describing changes
- Incremental feature development with version control checkpoints

### Code Quality
- ✓ Well-structured, organized codebase
- ✓ Separation of concerns (models, services, UI)
- ✓ Proper formatting and linting
- ✓ No errors, warnings, or critical issues
- ✓ DRY principles with reusable components

### Documentation
- Comprehensive README with setup instructions
- Code comments for complex logic
- Test descriptions for all test cases
- Project structure documentation

---

## 🚧 Future Enhancements

- **Firebase Authentication** integration for user login/signup
- **Cloud Firestore** database for product and order data
- **Search functionality** across products and collections
- **User accounts** with order history
- **Payment integration** for real checkout
- **Favorites/Wishlist** feature
- **Product reviews** and ratings

---

## 📚 Resources & References

- [UPSU Shop Website](https://shop.upsu.net) - Reference implementation
- [Flutter Documentation](https://docs.flutter.dev/) - Official Flutter docs
- [Dart Documentation](https://dart.dev/guides) - Dart language guide
- [Material Design](https://m3.material.io/) - UI design guidelines

---

## 👨‍💻 Development

This project was developed as part of university coursework following Flutter best practices and modern mobile development standards. The implementation demonstrates:

- Clean architecture principles
- Test-driven development approach
- Responsive design patterns
- State management best practices
- Component-based UI development

---

## 📄 License

This project is developed for educational purposes as part of university coursework at the University of Portsmouth.

---

**Developed with Flutter** 💙 | **University of Portsmouth** 🎓 | **2024-2025**
