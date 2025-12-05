import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('HomeScreen Tests', () {
    testWidgets('should display app header with banner', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that header banner is present
      expect(
        find.text(
          'NEW TERM STOCK — University essentials and branded merch available now. Free click & collect for students. Visit shop.upsu.net for opening times and offers.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display hero section text', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check hero section text
      expect(
        find.text('Union Shop – Official Students\' Union Store'),
        findsOneWidget,
      );
      expect(
        find.text(
          "Support your Students' Union — campus essentials, course supplies and official merch. Browse online or visit our campus store.",
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display hero section buttons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check for call-to-action buttons
      expect(find.text('SHOP NOW'), findsOneWidget);
      expect(find.text('PERSONALISE'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display featured products section', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check products section header
      expect(find.text('FEATURED PRODUCTS'), findsOneWidget);
      expect(
        find.text(
          'Essential campus kit and new arrivals — shop online or collect in-store at the Students\' Union.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that product cards are displayed
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('Union Hoodie'), findsOneWidget);
      expect(find.text('City Postcard Pack'), findsOneWidget);
      expect(find.text('Union Tote Bag'), findsOneWidget);
    });

    testWidgets('should display product prices', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check prices are displayed
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£8.00'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_cart), findsWidgets);
      expect(find.byIcon(Icons.menu), findsWidgets);
    });

    testWidgets('should navigate to product page on card tap', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Tap on first product card
      await tester.tap(find.text('Portsmouth City Magnet'));
      await tester.pumpAndSettle();

      // Verify navigation to product page
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should show snackbar when placeholder button pressed',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Tap search icon
      await tester.tap(find.byIcon(Icons.search).first);
      await tester.pumpAndSettle();

      // Check snackbar appears
      expect(
        find.text('Feature coming soon — visit shop.upsu.net for full service'),
        findsOneWidget,
      );
    });
  });

  group('ProductCard Tests', () {
    testWidgets('should display product image', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that images are loaded (or error builder is shown)
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should display product info', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Verify product titles and prices are visible
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
    });
  });
}
