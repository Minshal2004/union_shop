import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';
import 'package:union_shop/data/sample_data.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
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

  // Sorting state and a mutable copy of the sample collections so we can sort
  String _sortValue = 'Relevance';
  late List _collections;

  @override
  void initState() {
    super.initState();
    // create a local copy so sorting doesn't mutate the source data
    _collections = List.from(sampleCollections);
  }

  void _onSortChanged(String? value) {
    if (value == null) return;
    setState(() {
      _sortValue = value;
      // Sort alphabetically by title when the sort value changes
      _collections.sort((a, b) =>
          (a.title ?? '').toString().compareTo((b.title ?? '').toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the shared sample collections data for rendering
    final collections = _collections;

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
                    'Collections',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // Sort and filter controls (non-functional placeholders)
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: _sortValue,
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
                        onChanged: _onSortChanged,
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: 'All',
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(
                              value: 'Clothing', child: Text('Clothing')),
                          DropdownMenuItem(
                              value: 'Accessories', child: Text('Accessories')),
                          DropdownMenuItem(
                              value: 'Gifts', child: Text('Gifts')),
                        ],
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Featured collections grid (uses Collection model)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: collections
                        .take(4)
                        .map((c) => Card(
                              elevation: 2,
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, '/collection',
                                    arguments: c),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: c.imageUrl.isNotEmpty
                                          ? Image.network(
                                              c.imageUrl,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Container(
                                                color: Colors.grey[200],
                                                child: const Center(
                                                  child: Icon(
                                                      Icons.image_not_supported,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            )
                                          : Container(color: Colors.grey[200]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(c.title,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(height: 6),
                                          Text('${c.products.length} items',
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
                  const Text(
                    'Browse our product collections — official merch and essentials for campus life.',
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: collections.map((c) {
                      return Card(
                        elevation: 2,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, '/collection',
                              arguments: c),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: c.imageUrl.isNotEmpty
                                    ? Image.network(
                                        c.imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                          color: Colors.grey[200],
                                          child: const Center(
                                              child: Icon(
                                                  Icons.image_not_supported,
                                                  color: Colors.grey)),
                                        ),
                                      )
                                    : Container(color: Colors.grey[200]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(c.title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 6),
                                    Text('${c.products.length} items',
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey)),
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
