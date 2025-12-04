/// Product model used across the app.
///
/// Fields:
/// - id: unique identifier for the product
/// - name: display name for the product
/// - price: formatted price string (e.g. "£10.00")
/// - imageUrl: image location (network/local)
/// - description: long-form product description

class Product {
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  final String description;

  Product({
    String? id,
    String? name,
    String? title,
    this.price = '',
    this.imageUrl = '',
    this.description = '',
  })  : id = id ?? '',
        name = name ?? title ?? '';

  // Backwards-compatible getter for code that expects `title`.
  String get title => name;
}
