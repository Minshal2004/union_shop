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
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // Backwards-compatible getter for code that expects `title`.
  String get title => name;

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toString() ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toString() ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
