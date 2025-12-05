import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('should create product with all fields', () {
      final product = Product(
        id: '123',
        name: 'Test Product',
        price: '£10.00',
        imageUrl: 'https://example.com/image.jpg',
        description: 'Test description',
      );

      expect(product.id, '123');
      expect(product.name, 'Test Product');
      expect(product.price, '£10.00');
      expect(product.imageUrl, 'https://example.com/image.jpg');
      expect(product.description, 'Test description');
    });

    test('should use title parameter for name', () {
      final product = Product(
        title: 'Test Product',
        price: '£10.00',
      );

      expect(product.name, 'Test Product');
      expect(product.title, 'Test Product');
    });

    test('should prefer name over title', () {
      final product = Product(
        name: 'Product Name',
        title: 'Product Title',
        price: '£10.00',
      );

      expect(product.name, 'Product Name');
      expect(product.title, 'Product Name');
    });

    test('should have default values', () {
      final product = Product();

      expect(product.id, '');
      expect(product.name, '');
      expect(product.price, '');
      expect(product.imageUrl, '');
      expect(product.description, '');
    });

    test('should support title getter for backward compatibility', () {
      final product = Product(
        name: 'Test Product',
        price: '£10.00',
      );

      expect(product.title, equals(product.name));
    });

    test('should handle null values', () {
      final product = Product(
        id: null,
        name: null,
        price: '£10.00',
      );

      expect(product.id, '');
      expect(product.name, '');
      expect(product.price, '£10.00');
    });
  });
}
