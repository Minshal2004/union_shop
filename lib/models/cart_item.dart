import 'package:union_shop/models/product.dart';

/// Simple CartItem used for holding a Product and a quantity in a cart.
class CartItem {
  final Product product;
  int quantity;
  String? selectedOption;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedOption,
  });

  double get unitPrice {
    final cleaned = (product.price ?? '').replaceAll(RegExp('[^0-9\.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  double get totalPrice => unitPrice * quantity;

  // serialization removed: store Product directly without toJson/fromJson
}
