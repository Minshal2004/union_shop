/// Product model used across the app.
///
/// Fields:
/// - title: display name for the product
/// - price: formatted price string (e.g. "£10.00")
/// - imageUrl: image location (network/local)
/// - description: long-form product description

class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.description = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String? ?? '',
      price: json['price'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  @override
  String toString() => 'Product(title: $title, price: $price)';
}
