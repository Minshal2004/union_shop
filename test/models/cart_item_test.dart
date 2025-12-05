import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartItem Model Tests', () {
    test('should create cart item with product and quantity', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );

      final cartItem = CartItem(product: product, quantity: 3);

      expect(cartItem.product.title, 'Test Product');
      expect(cartItem.quantity, 3);
    });

    test('should have default quantity of 1', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.quantity, 1);
    });

    test('should calculate unit price from product price', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.unitPrice, 10.00);
    });

    test('should calculate total price correctly', () {
      final product = Product(
        title: 'Test Product',
        price: '£15.50',
        description: 'Test',
      );

      final cartItem = CartItem(product: product, quantity: 3);

      expect(cartItem.totalPrice, 46.50);
    });

    test('should handle prices with currency symbols', () {
      final product = Product(
        title: 'Test Product',
        price: '£25.99',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.unitPrice, 25.99);
    });

    test('should handle prices without currency symbols', () {
      final product = Product(
        title: 'Test Product',
        price: '20.00',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.unitPrice, 20.00);
    });

    test('should handle invalid price as 0', () {
      final product = Product(
        title: 'Test Product',
        price: 'invalid',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.unitPrice, 0.0);
    });

    test('should handle empty price as 0', () {
      final product = Product(
        title: 'Test Product',
        price: '',
        description: 'Test',
      );

      final cartItem = CartItem(product: product);

      expect(cartItem.unitPrice, 0.0);
    });

    test('should allow quantity to be updated', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test',
      );

      final cartItem = CartItem(product: product, quantity: 2);
      expect(cartItem.quantity, 2);

      cartItem.quantity = 5;
      expect(cartItem.quantity, 5);
      expect(cartItem.totalPrice, 50.00);
    });
  });
}
