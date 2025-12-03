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
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
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
              height: 400,
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
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Union Shop – Official Students\' Union Store',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Support your Students' Union — campus essentials, course supplies and official merch. Browse online or visit our campus store.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () => navigateToProduct(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'SHOP NOW',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
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
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: products
                          .map((p) => ProductCard(product: p))
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
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: _hovering
            ? (Matrix4.identity()..translate(0, -6, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _hovering
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6))
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/product',
                arguments: widget.product),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        widget.product.title,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.price,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
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
