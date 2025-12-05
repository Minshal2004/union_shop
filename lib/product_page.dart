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
  final List<String> _sizeOptions = ['Select size', 'S', 'M', 'L', 'XL'];
  // Selected colour (UI-only)
  String _selectedColor = 'Charcoal';
  final List<String> _colorOptions = ['Charcoal', 'Navy', 'White', 'Grey'];
  // Selected quantity for adding to cart
  int _quantity = 1;
  // Main image URL shown in the large image area; thumbnails may replace it
  late String _mainImageUrl;
  // Hardcoded clothing images (public placeholders / store images)
  static const hoodieImage = 'https://shop.upsu.net/media/catalog/product/h/o/hoodie_charcoal.jpg';
  static const sweatshirtImage = 'https://images.unsplash.com/photo-1520975914686-9c3f1b6f59b5?auto=format&fit=crop&w=800&q=60';
  static const tshirtImage = 'https://shop.upsu.net/media/catalog/product/t/s/tshirt_white.jpg';
  static const trousersImage = 'https://shop.upsu.net/media/catalog/product/t/r/trousers_grey.jpg';

  final List<String> _exampleImages = [hoodieImage, sweatshirtImage, tshirtImage, trousersImage];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_productInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      final Product? productFromArgs = args is Product ? args : null;
      _product = widget.product ?? productFromArgs;
      // initialize the main image from the product or pick a fallback based on title
      if ((_product?.imageUrl?.isNotEmpty ?? false)) {
        _mainImageUrl = _product!.imageUrl;
      } else {
        final title = (_product?.title ?? '').toLowerCase();
        if (title.contains('hoodie')) {
          _mainImageUrl = hoodieImage;
        } else if (title.contains('sweat') || title.contains('sweatshirt')) {
          _mainImageUrl = sweatshirtImage;
        } else if (title.contains('t-shirt') || title.contains('tshirt') || title.contains('tee')) {
          _mainImageUrl = tshirtImage;
        } else if (title.contains('trouser') || title.contains('jogger') || title.contains('chino')) {
          _mainImageUrl = trousersImage;
        } else {
          _mainImageUrl = _exampleImages.first;
        }
      }
      _productInitialized = true;
    }
  }

  String _fallbackForTitle(String title) {
    final t = title.toLowerCase();
    if (t.contains('hoodie')) return hoodieImage;
    if (t.contains('sweat') || t.contains('sweatshirt')) return sweatshirtImage;
    if (t.contains('t-shirt') || t.contains('tshirt') || t.contains('tee')) return tshirtImage;
    if (t.contains('trouser') || t.contains('jogger') || t.contains('chino')) return trousersImage;
    return hoodieImage;
  }

  @override
  Widget build(BuildContext context) {
    // Use the product stored in state (initialized from widget or route args)
    final product = _product;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: LayoutBuilder(builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            Widget imageColumn = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large image (always show fallback by title on error)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      _mainImageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        final fallback = _fallbackForTitle(product.title);
                        return Image.network(
                          fallback,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Thumbnails (product image first if present, then example images)
                SizedBox(
                  height: 72,
                  child: Builder(builder: (context) {
                    final thumbs = <String>[];
                    if (_product?.imageUrl != null && _product!.imageUrl.isNotEmpty) {
                      thumbs.add(_product!.imageUrl);
                    }
                    thumbs.addAll(_exampleImages);

                    final thumbWidgets = thumbs.toSet().map((img) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () => setState(() => _mainImageUrl = img),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  img,
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                  errorBuilder: (_, __, ___) {
                                    final fallback = _fallbackForTitle(product.title);
                                    return Image.network(
                                      fallback,
                                      fit: BoxFit.cover,
                                      width: 72,
                                      height: 72,
                                      errorBuilder: (_, __, ___) => Container(
                                        color: Colors.grey[200],
                                        width: 72,
                                        height: 72,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        )).toList();

                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: thumbWidgets,
                    );
                  }),
                ),
              ],
            );

            Widget detailsColumn = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(product.price,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4d2963))),
                const SizedBox(height: 6),
                const Text('Includes VAT where applicable', style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 16),

                // Size + Color
                Row(children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedSize,
                      decoration: const InputDecoration(labelText: 'Size'),
                      items: _sizeOptions.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                      onChanged: (v) => setState(() => _selectedSize = v ?? _selectedSize),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedColor,
                      decoration: const InputDecoration(labelText: 'Color'),
                      items: _colorOptions.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                      onChanged: (v) => setState(() => _selectedColor = v ?? _selectedColor),
                    ),
                  ),
                ]),

                const SizedBox(height: 12),
                Row(children: [
                  const Text('Qty:'),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    value: _quantity,
                    items: List.generate(10, (i) => i + 1).map((q) => DropdownMenuItem(value: q, child: Text(q.toString()))).toList(),
                    onChanged: (v) => setState(() => _quantity = v ?? _quantity),
                  ),
                  const Spacer(),
                ]),

                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final sizeLabel = _selectedSize == 'Select size' ? 'no size selected' : _selectedSize;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added $_quantity × ${product.title} (Size: $sizeLabel, Color: $_selectedColor) to cart'),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                    child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('ADD TO CART')),
                  ),
                ),

                const SizedBox(height: 20),
                const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),
              ],
            );

            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(onLogoTap: () => navigateToHome(context), onButtonPressed: () => placeholderCallbackForButtons(context)),
                  const SizedBox(height: 8),
                  imageColumn,
                  const SizedBox(height: 16),
                  detailsColumn,
                  const SizedBox(height: 24),
                  AppFooter(),
                ],
              );
            }

            // Desktop: two-column layout. Avoid Expanded inside a
            // SingleChildScrollView by computing fixed widths from constraints.
            final gap = 28.0;
            final contentWidth = constraints.maxWidth;
            final leftWidth = (contentWidth - gap) * 0.6;
            final rightWidth = contentWidth - gap - leftWidth;

            return Column(
              children: [
                AppHeader(onLogoTap: () => navigateToHome(context), onButtonPressed: () => placeholderCallbackForButtons(context)),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: leftWidth, child: imageColumn),
                    SizedBox(width: gap),
                    SizedBox(width: rightWidth, child: detailsColumn),
                  ],
                ),
                const SizedBox(height: 32),
                AppFooter(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
