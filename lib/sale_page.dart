import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';
import 'package:union_shop/models/product.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    final saleProducts = <Product>[
      Product(
        title: 'Union Hoodie - Was £30.00',
        price: '£24.00',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/hoodie_1024.jpg',
        description: 'Limited time offer on selected hoodies.',
      ),
      Product(
        title: 'Logo T‑Shirt - Was £18.00',
        price: '£14.40',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/tshirt_1024.jpg',
        description: 'Classic branded tee — now discounted.',
      ),
      Product(
        title: 'Campus Tote - Was £10.00',
        price: '£8.00',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/tote_1024.jpg',
        description: 'Reusable tote bag — student favourite.',
      ),
      Product(
        title: 'Postcard Pack - Was £15.00',
        price: '£12.00',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/postcards_1024.jpg',
        description: 'Set of city postcards — great as gifts.',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              onLogoTap: () => navigateToHome(context),
              onButtonPressed: () => placeholderCallbackForButtons(context),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sale',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Selected items discounted for a limited time. Click a product to view details.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: saleProducts.map((p) {
                      return Card(
                        elevation: 2,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, '/product',
                              arguments: p),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  p.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.grey)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(p.title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 6),
                                    Text(p.price,
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
