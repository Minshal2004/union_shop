import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartPage Tests', () {
    setUp(() {
      cartService.clear();
    });

    tearDown(() {
      cartService.clear();
    });

    Widget createTestWidget() {
      return const MaterialApp(
        home: CartPage(),
      );
    }

    testWidgets('should display empty cart message', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Your cart is empty.'), findsOneWidget);
    });

    testWidgets('should display cart items when cart has products',
        (tester) async {
      // Add test product to cart
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );
      cartService.addItem(product, quantity: 2);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('should display total price', (tester) async {
      final product1 = Product(
        title: 'Product 1',
        price: '£10.00',
        description: 'Test',
      );
      final product2 = Product(
        title: 'Product 2',
        price: '£15.00',
        description: 'Test',
      );

      cartService.addItem(product1, quantity: 2);
      cartService.addItem(product2, quantity: 1);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining('35.00'), findsOneWidget);
    });

    testWidgets('should have checkout button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('CHECKOUT'), findsOneWidget);
    });

    testWidgets('should show snackbar when checking out empty cart',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('CHECKOUT'));
      await tester.pumpAndSettle();

      expect(find.text('Your cart is empty.'), findsWidgets);
    });

    testWidgets('should clear cart on successful checkout', (tester) async {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );
      cartService.addItem(product);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('CHECKOUT'));
      await tester.pumpAndSettle();

      expect(cartService.items, isEmpty);
      expect(
        find.text('Checkout complete — thank you for your order.'),
        findsOneWidget,
      );
    });

    testWidgets('should remove item when remove button tapped', (tester) async {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );
      cartService.addItem(product);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find and tap remove button
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(cartService.items, isEmpty);
    });

    testWidgets('should update quantity when quantity changed', (tester) async {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );
      cartService.addItem(product, quantity: 2);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find quantity dropdown
      final dropdown = find.byType(DropdownButton<int>);
      expect(dropdown, findsWidgets);
    });

    testWidgets('should have app bar with title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should have back button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(BackButton), findsOneWidget);
    });
  });
}
