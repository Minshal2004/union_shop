import 'package:union_shop/models/product.dart';

/// Simple Collection model for static sample data.
class Collection {
  final String id;
  final String title;
  final String category;
  final List<Product> products;
  final String imageUrl;
  final String description;

  Collection({
    String? id,
    String? title,
    String? category,
    List<Product>? products,
    this.imageUrl = '',
    this.description = '',
  })  : id = id ?? '',
        title = title ?? '',
        category = category ?? '',
        products = products ?? const [];

  // Keep model minimal and static; no toMap/fromMap or JSON helpers.
}
