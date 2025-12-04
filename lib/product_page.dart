import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/app_footer.dart';

class ProductPage extends StatefulWidget {
  final Product? product;

  const ProductPage({super.key, this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:
          Text('Feature coming soon — visit shop.upsu.net for full service'),
      duration: Duration(seconds: 2),
    ));
  }

  // Hold the currently displayed product in state so it can be reused/updated.
  Product? _product;
  bool _productInitialized = false;

  // Selected size/option for the product (updated via Dropdown)
  String _selectedSize = 'Select size';
  final List<String> _sizeOptions = ['Select size', 'Small', 'Medium', 'Large'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_productInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      final Product? productFromArgs = args is Product ? args : null;
      _product = widget.product ?? productFromArgs;
      _productInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the product stored in state (initialized from widget or route args)
    final product = _product;

    // The UI below uses product.title, product.imageUrl, product.price and
    // product.description to render the page dynamically.

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
          backgroundColor: const Color(0xFF4d2963),
        ),
        body: const Center(
          child: Text('Product not found', style: TextStyle(fontSize: 18)),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            AppHeader(
              onLogoTap: () => navigateToHome(context),
              onButtonPressed: () => placeholderCallbackForButtons(context),
            ),

            // Product details (from route arguments)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image unavailable',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Size / option selector
                  Row(
                    children: [
                      const Text('Size:', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: _selectedSize,
                        items: _sizeOptions
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(s),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val == null) return;
                          setState(() {
                            _selectedSize = val;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
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
