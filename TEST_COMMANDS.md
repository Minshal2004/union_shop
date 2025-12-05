# Union Shop - Quick Test Commands
# Copy and paste these commands to run specific tests

# Run ALL tests
flutter test

# Run individual test files
flutter test test/home_test.dart
flutter test test/product_test.dart
flutter test test/cart_service_test.dart
flutter test test/cart_page_test.dart
flutter test test/models/product_test.dart
flutter test test/models/cart_item_test.dart
flutter test test/widgets/app_header_test.dart

# Run tests with coverage
flutter test --coverage

# Run tests in verbose mode
flutter test --reporter expanded

# Run a specific test by name
flutter test --plain-name "should display product title"

# Check for errors without running tests
flutter analyze
