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
  // Category filter state
  String _categoryValue = 'All';
  // Pagination state
  int _currentPage = 0;
  final int _pageSize = 4;
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
      // Always sort the currently visible collections alphabetically (case-insensitive)
      _collections.sort((a, b) => ((a.title ?? '').toString().toLowerCase())
          .compareTo((b.title ?? '').toString().toLowerCase()));
      // reset to first page when sorting changes
      _currentPage = 0;
    });
  }

  void _onCategoryChanged(String? value) {
    if (value == null) return;
    setState(() {
      _categoryValue = value;
      // rebuild filtered collections from the original sample data
      final base = List.from(sampleCollections);
      _collections = base.where((c) {
        final cat = (c.category ?? '').toString();
        return _categoryValue == 'All' || cat == _categoryValue;
      }).toList();
      // preserve current sort if not 'Relevance'
      if (_sortValue != 'Relevance') {
        _collections.sort((a, b) =>
            (a.title ?? '').toString().compareTo((b.title ?? '').toString()));
      }
      // clamp or reset current page when filtering changes
      _currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the shared sample collections data for rendering
    final collections = _collections;
    // pagination calculations
    final totalPages = (collections.length + _pageSize - 1) ~/ _pageSize;
    final startIndex = _currentPage * _pageSize;
    final pageCollections = collections.skip(startIndex).take(_pageSize).toList();

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
                        value: _categoryValue,
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(
                              value: 'Clothing', child: Text('Clothing')),
                          DropdownMenuItem(
                              value: 'Accessories', child: Text('Accessories')),
                          DropdownMenuItem(
                              value: 'Gifts', child: Text('Gifts')),
                        ],
                        onChanged: _onCategoryChanged,
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
                    children: pageCollections.map((c) {
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
                                            fontSize: 14, fontWeight: FontWeight.w600)),
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

                  // Pagination controls
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _currentPage > 0
                            ? () => setState(() => _currentPage--)
                            : null,
                        child: const Text('Previous'),
                      ),
                      const SizedBox(width: 12),
                      Text('${_currentPage + 1} of ${totalPages == 0 ? 1 : totalPages}'),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _currentPage < (totalPages - 1)
                            ? () => setState(() => _currentPage++)
                            : null,
                        child: const Text('Next'),
                      ),
                    ],
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
