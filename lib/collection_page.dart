import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';
import 'package:union_shop/models/collection.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
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

  // Store the collection and a mutable visible products list so we can
  // filter/sort/paginate locally.
  Collection? _collection;
  late List _visibleProducts;
  // Keep an original snapshot so we can restore "Relevance" ordering
  late List _originalProducts;
  bool _productsInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_productsInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      _collection = args is Collection ? args : null;
      _visibleProducts = List.from(_collection?.products ?? []);
      // save original order for "Relevance"
      _originalProducts = List.from(_visibleProducts);
      _productsInitialized = true;
    }
  }

  // Sort state and handler
  String _sortValue = 'Relevance';

  void _onSortChanged(String? value) {
    if (value == null) return;
    setState(() {
      _sortValue = value;
      if (_sortValue == 'Relevance') {
        // restore original order
        _visibleProducts = List.from(_originalProducts);
        return;
      }

      if (_sortValue == 'Title') {
        _visibleProducts.sort((a, b) =>
            (a.title ?? '').toString().toLowerCase()
                .compareTo((b.title ?? '').toString().toLowerCase()));
        return;
      }

      // price-based sorting: try to parse numeric value from price string
      double parsePrice(String p) {
        final cleaned = p.replaceAll(RegExp('[^0-9\.]'), '');
        return double.tryParse(cleaned) ?? 0.0;
      }

      if (_sortValue == 'PriceLow') {
        _visibleProducts.sort((a, b) =>
            parsePrice((a.price ?? '').toString()).compareTo(
                parsePrice((b.price ?? '').toString())));
        return;
      }

      if (_sortValue == 'PriceHigh') {
        _visibleProducts.sort((a, b) =>
            parsePrice((b.price ?? '').toString()).compareTo(
                parsePrice((a.price ?? '').toString())));
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the collection and its mutable visibleProducts initialized in
    // didChangeDependencies.
    final collection = _collection;
    final products = _visibleProducts;

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
                  Text(collection?.title ?? 'Collection',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  // Sort By and Filter dropdowns
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: _sortValue,
                        items: const [
                          DropdownMenuItem(
                              value: 'Relevance', child: Text('Relevance')),
                          DropdownMenuItem(value: 'Title', child: Text('Title')),
                          DropdownMenuItem(
                              value: 'PriceLow', child: Text('Price: Low to High')),
                          DropdownMenuItem(
                              value: 'PriceHigh', child: Text('Price: High to Low')),
                        ],
                        onChanged: _onSortChanged,
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: 'All',
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(value: 'Small', child: Text('Small')),
                          DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                          DropdownMenuItem(value: 'Large', child: Text('Large')),
                        ],
                        onChanged: (_) {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Text('${products.length} items',
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 12),

                  // Products from the provided collection (or a friendly fallback)
                  if (products.isEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      alignment: Alignment.center,
                      child: const Text('No products in this collection',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    )
                  else
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 800 ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: products
                          .map((p) => Card(
                                elevation: 2,
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/product',
                                      arguments: p),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: p.imageUrl.isNotEmpty
                                            ? Image.network(
                                                p.imageUrl,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Container(
                                                  color: Colors.grey[200],
                                                  child: const Center(
                                                      child: Icon(
                                                          Icons
                                                              .image_not_supported,
                                                          color: Colors.grey)),
                                                ),
                                              )
                                            : Container(
                                                color: Colors.grey[200]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(p.title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(height: 6),
                                            Text(p.price,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  const SizedBox(height: 12),
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
