import 'package:flutter/foundation.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(Product product, {int quantity = 1, String? selectedOption}) {
    // match existing by product title and selected option (simple heuristic)
    final index = _items.indexWhere((ci) =>
        (ci.product.title ?? '') == (product.title ?? '') &&
        (ci.selectedOption ?? '') == (selectedOption ?? ''));

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(
        product: product,
        quantity: quantity,
        selectedOption: selectedOption,
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

  // Convenience: find by product and option
  CartItem? findItem(Product product, {String? selectedOption}) {
    return _items.firstWhere(
        (ci) => (ci.product.title ?? '') == (product.title ?? '') &&
            (ci.selectedOption ?? '') == (selectedOption ?? ''),
        orElse: () => null as CartItem);
  }
}

// Singleton instance used throughout the app
final cartService = CartService();
