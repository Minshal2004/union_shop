import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('ProductPage Tests', () {
    final testProduct = Product(
      title: 'Test Product',
      price: '£20.00',
      imageUrl: 'https://example.com/image.jpg',
      description: 'This is a test product description.',
    );

    Widget createTestWidget({Product? product}) {
      return MaterialApp(
        home: ProductPage(product: product ?? testProduct),
      );
    }

    testWidgets('should display product title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsWidgets);
    });

    testWidgets('should display product price', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('£20.00'), findsOneWidget);
    });

    testWidgets('should display product description', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('This is a test product description.'), findsOneWidget);
    });

    testWidgets('should display quantity selector', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
    });

    testWidgets('should increase quantity when add button pressed',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Initial quantity is 1
      expect(find.text('1'), findsOneWidget);

      // Tap add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Quantity should be 2
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('should decrease quantity when remove button pressed',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Increase to 2 first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      // Tap remove button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      // Quantity should be back to 1
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should not decrease quantity below 1', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Quantity is 1, remove button should be disabled
      final removeButton = tester.widget<IconButton>(
        find.ancestor(
          of: find.byIcon(Icons.remove),
          matching: find.byType(IconButton),
        ),
      );

      expect(removeButton.onPressed, isNull);
    });

    testWidgets('should display add to cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    testWidgets('should show snackbar when add to cart pressed',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Tap add to cart
      await tester.tap(find.text('ADD TO CART'));
      await tester.pumpAndSettle();

      // Check snackbar appears
      expect(find.text('Added 1 × Test Product to cart'), findsOneWidget);
    });

    testWidgets('should show correct quantity in snackbar', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Increase quantity to 3
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Tap add to cart
      await tester.tap(find.text('ADD TO CART'));
      await tester.pumpAndSettle();

      // Check snackbar shows correct quantity
      expect(find.text('Added 3 × Test Product to cart'), findsOneWidget);
    });

    testWidgets('should display default text when product is null',
        (tester) async {
      await tester.pumpWidget(createTestWidget(product: null));
      await tester.pumpAndSettle();

      expect(find.text('Product title'), findsOneWidget);
      expect(find.text('Price unavailable'), findsOneWidget);
      expect(find.text('No description available.'), findsOneWidget);
    });

    testWidgets('should have app bar with product title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Test Product'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should have back button in app bar', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Back button should be present
      expect(find.byType(BackButton), findsOneWidget);
    });
  });
}
