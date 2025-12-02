import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

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
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hoodies',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  // Sort By and Filter dropdowns (non-functional)
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: 'Relevance',
                        items: const [
                          DropdownMenuItem(
                              value: 'Relevance', child: Text('Relevance')),
                          DropdownMenuItem(
                              value: 'PriceLow',
                              child: Text('Price: Low to High')),
                          DropdownMenuItem(
                              value: 'PriceHigh',
                              child: Text('Price: High to Low')),
                        ],
                        onChanged: (_) {},
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: 'All',
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(
                              value: 'Small', child: Text('Small')),
                          DropdownMenuItem(
                              value: 'Medium', child: Text('Medium')),
                          DropdownMenuItem(
                              value: 'Large', child: Text('Large')),
                        ],
                        onChanged: (_) {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Text(
                      'A selection of official Union hoodies — available in a range of sizes and colours.',
                      style: TextStyle(fontSize: 16, height: 1.5)),
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
