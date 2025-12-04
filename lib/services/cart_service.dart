import 'package:flutter/foundation.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(Product product, {int quantity = 1}) {
    // match existing by product title (simple heuristic for this demo)
    final index = _items.indexWhere((ci) => ci.product.title == product.title);

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(
        product: product,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    final index = _items.indexOf(item);
    if (index < 0) return;
    if (quantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index].quantity = quantity;
    }
    notifyListeners();
  }

  double totalPrice() {
    return _items.fold(0.0, (sum, ci) => sum + ci.totalPrice);
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  // Convenience: find by product title
  CartItem? findItem(Product product) {
    for (final ci in _items) {
      if (ci.product.title == product.title) return ci;
    }
    return null;
  }
}

// Singleton instance used throughout the app
final cartService = CartService();
