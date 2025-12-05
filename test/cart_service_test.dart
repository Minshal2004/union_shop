import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartService Tests', () {
    late CartService service;

    setUp(() {
      service = CartService();
    });

    tearDown(() {
      service.clear();
    });

    test('should start with empty cart', () {
      expect(service.items, isEmpty);
    });

    test('should add item to cart', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product);

      expect(service.items.length, 1);
      expect(service.items.first.product.title, 'Test Product');
      expect(service.items.first.quantity, 1);
    });

    test('should add multiple quantities of same item', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product, quantity: 3);

      expect(service.items.length, 1);
      expect(service.items.first.quantity, 3);
    });

    test('should increase quantity when adding same product twice', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product, quantity: 2);
      service.addItem(product, quantity: 3);

      expect(service.items.length, 1);
      expect(service.items.first.quantity, 5);
    });

    test('should add different products separately', () {
      final product1 = Product(
        title: 'Product 1',
        price: '£10.00',
        description: 'Test description',
      );
      final product2 = Product(
        title: 'Product 2',
        price: '£15.00',
        description: 'Test description',
      );

      service.addItem(product1);
      service.addItem(product2);

      expect(service.items.length, 2);
    });

    test('should remove item from cart', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product);
      expect(service.items.length, 1);

      service.removeItem(service.items.first);
      expect(service.items, isEmpty);
    });

    test('should update quantity of item', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product, quantity: 2);
      expect(service.items.first.quantity, 2);

      service.updateQuantity(service.items.first, 5);
      expect(service.items.first.quantity, 5);
    });

    test('should remove item when updating quantity to 0', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product);
      expect(service.items.length, 1);

      service.updateQuantity(service.items.first, 0);
      expect(service.items, isEmpty);
    });

    test('should calculate total price correctly', () {
      final product1 = Product(
        title: 'Product 1',
        price: '£10.00',
        description: 'Test description',
      );
      final product2 = Product(
        title: 'Product 2',
        price: '£15.00',
        description: 'Test description',
      );

      service.addItem(product1, quantity: 2); // 20.00
      service.addItem(product2, quantity: 1); // 15.00

      expect(service.totalPrice(), 35.00);
    });

    test('should clear all items', () {
      final product1 = Product(
        title: 'Product 1',
        price: '£10.00',
        description: 'Test description',
      );
      final product2 = Product(
        title: 'Product 2',
        price: '£15.00',
        description: 'Test description',
      );

      service.addItem(product1);
      service.addItem(product2);
      expect(service.items.length, 2);

      service.clear();
      expect(service.items, isEmpty);
    });

    test('should find item by product', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product, quantity: 3);

      final found = service.findItem(product);
      expect(found, isNotNull);
      expect(found?.quantity, 3);
    });

    test('should return null when item not found', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      final found = service.findItem(product);
      expect(found, isNull);
    });

    test('should notify listeners when item added', () {
      var notified = false;
      service.addListener(() {
        notified = true;
      });

      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product);
      expect(notified, isTrue);
    });

    test('should notify listeners when item removed', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
        description: 'Test description',
      );

      service.addItem(product);

      var notified = false;
      service.addListener(() {
        notified = true;
      });

      service.removeItem(service.items.first);
      expect(notified, isTrue);
    });
  });
}
