// ...new file...
import 'package:flutter/foundation.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

/// CartService holds cart items and exposes methods to mutate the cart.
/// It extends ChangeNotifier so widgets can listen to changes.
class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  /// Adds a product to the cart. If the product already exists, increase quantity.
  void addProduct(Product product, [int quantity = 1]) {
    if (quantity <= 0) return;
    final idx = _items.indexWhere((c) => c.product.id == product.id);
    if (idx >= 0) {
      final existing = _items[idx];
      _items[idx] = existing.copyWith(quantity: existing.quantity + quantity);
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  /// Removes a product from the cart by product id.
  void removeProduct(String productId) {
    _items.removeWhere((c) => c.product.id == productId);
    notifyListeners();
  }

  /// Updates the quantity for a product. If quantity <= 0 the item is removed.
  void updateQuantity(String productId, int quantity) {
    final idx = _items.indexWhere((c) => c.product.id == productId);
    if (idx < 0) return;
    if (quantity <= 0) {
      _items.removeAt(idx);
    } else {
      _items[idx] = _items[idx].copyWith(quantity: quantity);
    }
    notifyListeners();
  }

  /// Clears the cart.
  void clear() {
    _items.clear();
    notifyListeners();
  }

  /// Returns total number of items in the cart (sum of quantities).
  int totalItems() => _items.fold<int>(0, (s, c) => s + c.quantity);

  /// Attempts to compute a numeric total price. Product.price is a string so
  /// this strips non-numeric characters and parses a double; non-parsable
  /// values are treated as 0.0.
  double totalPrice() {
    double total = 0.0;
    for (final item in _items) {
      final raw = item.product.price;
      final numeric = raw.replaceAll(RegExp(r'[^0-9\.]'), '');
      final price = double.tryParse(numeric) ?? 0.0;
      total += price * item.quantity;
    }
    return total;
  }
}

// Simple shared instance for convenience in pages that don't use DI/provider.
final cartService = CartService();
