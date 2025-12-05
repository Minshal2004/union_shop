import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/app_header.dart';

void main() {
  group('AppHeader Tests', () {
    Widget createTestWidget({
      VoidCallback? onLogoTap,
      VoidCallback? onButtonPressed,
      VoidCallback? onCartTap,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppHeader(
            onLogoTap: onLogoTap,
            onButtonPressed: onButtonPressed,
            onCartTap: onCartTap,
          ),
        ),
      );
    }

    testWidgets('should display banner text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(
        find.text(
          'NEW TERM STOCK — University essentials and branded merch available now. Free click & collect for students. Visit shop.upsu.net for opening times and offers.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display navigation links on wide screens',
        (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should hide navigation links on narrow screens',
        (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsNothing);
      expect(find.text('About'), findsNothing);
      expect(find.text('Collections'), findsNothing);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display icon tooltips', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byTooltip('Search products'), findsOneWidget);
      expect(find.byTooltip('Your account'), findsOneWidget);
      expect(find.byTooltip('View basket'), findsOneWidget);
      expect(find.byTooltip('Open menu'), findsOneWidget);
    });

    testWidgets('should call onLogoTap when logo is tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(createTestWidget(
        onLogoTap: () => tapped = true,
      ));
      await tester.pumpAndSettle();

      // Tap the logo (InkWell containing the image)
      await tester.tap(find.byType(InkWell).first);
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('should call onButtonPressed when search icon tapped',
        (tester) async {
      var tapped = false;
      await tester.pumpWidget(createTestWidget(
        onButtonPressed: () => tapped = true,
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('should have correct height', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(Column),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxHeight, 100);
    });

    testWidgets('should have purple banner color', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final bannerContainer = tester.widget<Container>(
        find.ancestor(
          of: find.text(
            'NEW TERM STOCK — University essentials and branded merch available now. Free click & collect for students. Visit shop.upsu.net for opening times and offers.',
          ),
          matching: find.byType(Container),
        ),
      );

      expect(bannerContainer.color, const Color(0xFF4d2963));
    });
  });
}
