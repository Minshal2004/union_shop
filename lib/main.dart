import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/sign_in_page.dart';
import 'package:union_shop/app_footer.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/personalisation_page.dart';
import 'package:union_shop/about_print_shack.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // Use the provided `home` widget as the initial page; no explicit initialRoute.
      routes: {
        '/product': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return args is Product
              ? ProductPage(product: args)
              : const ProductPage();
        },
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/cart': (context) => const CartPage(),
        '/personalisation': (context) => const PersonalisationPage(),
        '/personalisation-about': (context) => const AboutPrintShackPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sale': (context) => const SalePage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons(BuildContext context) {
    // Show a brief notice for header actions that are not implemented yet
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:
          Text('Feature coming soon — visit shop.upsu.net for full service'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Sample product data — replace with real data source when available
    final products = <Product>[
      Product(
        title: 'Portsmouth City Magnet',
        price: '£10.00',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        description:
            'Collectible Portsmouth magnet — great for fridges and gifts.',
      ),
      Product(
        title: 'Union Hoodie',
        price: '£25.00',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        description: 'Comfortable unisex hoodie with Union Shop branding.',
      ),
      Product(
        title: 'City Postcard Pack',
        price: '£15.00',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        description:
            'Set of 5 postcards featuring the city — perfect for souvenirs.',
      ),
      Product(
        title: 'Union Tote Bag',
        price: '£8.00',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        description: 'Reusable tote bag with Union logo.',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            AppHeader(
              onLogoTap: () => navigateToHome(context),
              onButtonPressed: () => placeholderCallbackForButtons(context),
            ),

            // Hero Section
            SizedBox(
              height:
                  isMobile ? MediaQuery.of(context).size.height * 0.42 : 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned.fill(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            // allow full width on mobile, but cap width on wider screens
                            maxWidth: isMobile ? double.infinity : 1100,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Union Shop – Official Students\' Union Store',
                                style: TextStyle(
                                  fontSize: isMobile ? 20 : 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: isMobile ? 12 : 16),
                              Text(
                                "Support your Students' Union — campus essentials, course supplies and official merch. Browse online or visit our campus store.",
                                style: TextStyle(
                                  fontSize: isMobile ? 14 : 20,
                                  color: Colors.white,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: isMobile ? 20 : 32),
                              // buttons: stack vertically on mobile for easier tapping
                              isMobile
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                navigateToProduct(context),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF4d2963),
                                              foregroundColor: Colors.white,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 14.0),
                                              child: Text('SHOP NOW',
                                                  style: TextStyle(
                                                      letterSpacing: 1)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        OutlinedButton(
                                          onPressed: () =>
                                              Navigator.pushNamed(
                                                  context, '/personalisation'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor:
                                                const Color(0xFF4d2963),
                                            side: const BorderSide(
                                                color: Color(0xFF4d2963)),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 14.0),
                                            child: Text('PERSONALISE',
                                                style: TextStyle(
                                                    letterSpacing: 1)),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                navigateToProduct(context),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF4d2963),
                                              foregroundColor: Colors.white,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.zero,
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 12.0),
                                              child: Text(
                                                'SHOP NOW',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        OutlinedButton(
                                          onPressed: () => Navigator.pushNamed(
                                              context, '/personalisation'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor:
                                                const Color(0xFF4d2963),
                                            side: const BorderSide(
                                                color: Color(0xFF4d2963)),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 12.0),
                                            child: Text('PERSONALISE',
                                                style:
                                                    TextStyle(letterSpacing: 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
                child: Column(
                  children: [
                    const Text(
                      'FEATURED PRODUCTS',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Essential campus kit and new arrivals — shop online or collect in-store at the Students\' Union.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: isMobile ? 32 : 64),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isMobile ? 1 : 2,
                      // slightly increased spacing for improved breathing room
                      crossAxisSpacing: isMobile ? 16 : 28,
                      mainAxisSpacing: isMobile ? 28 : 56,
                      childAspectRatio: isMobile ? 1.6 : 1.4,
                      children: products
                          .map((p) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: isMobile ? 16.0 : 56.0,
                                    right: isMobile ? 0 : 0),
                                child: ProductCard(product: p),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            AppFooter(),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: (!_hovering || isMobile)
            ? Matrix4.identity()
            : (Matrix4.identity()..translate(0, -6, 0)),
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: _hovering && !isMobile ? 6 : 2,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/product',
                arguments: widget.product),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: isMobile ? 1.6 : 1.8,
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.product.price,
                        style: TextStyle(
                            fontSize: isMobile ? 13 : 14,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// end of file
