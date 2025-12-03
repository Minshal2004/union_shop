// ...new file...
import 'package:union_shop/models/product.dart';

/// Collection model representing a group of products.
class Collection {
  final String id;
  final String title;
  final String imageUrl;
  final List<Product> products;

  Collection({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.products,
  });

  factory Collection.fromMap(Map<String, dynamic> map) {
    final rawProducts = map['products'] as List<dynamic>?;
    return Collection(
      id: map['id']?.toString() ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      products: rawProducts
              ?.map((p) => p is Product
                  ? p
                  : Product.fromMap(Map<String, dynamic>.from(p as Map)))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'products': products.map((p) => p.toMap()).toList(),
    };
  }
}
