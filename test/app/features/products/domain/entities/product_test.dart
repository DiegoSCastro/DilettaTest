import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product Entity', () {
    const rating = Rating(rate: 4.5, count: 100);

    test('props should contain all properties', () {
      const product = Product(
        id: 1,
        price: 99.99,
        title: 'Test Product',
        description: 'This is a test product',
        category: 'Electronics',
        image: 'http://example.com/image.png',
        rating: rating,
      );

      expect(product.props, [
        1,
        99.99,
        'Test Product',
        'This is a test product',
        'Electronics',
        'http://example.com/image.png',
        rating,
      ]);
    });

    test('should support value equality', () {
      const product1 = Product(
        id: 1,
        price: 99.99,
        title: 'Test Product',
        description: 'This is a test product',
        category: 'Electronics',
        image: 'http://example.com/image.png',
        rating: rating,
      );

      const product2 = Product(
        id: 1,
        price: 99.99,
        title: 'Test Product',
        description: 'This is a test product',
        category: 'Electronics',
        image: 'http://example.com/image.png',
        rating: rating,
      );

      expect(product1, product2);
    });

    test('should have different hashcodes for different values', () {
      const product1 = Product(
        id: 1,
        price: 99.99,
        title: 'Test Product',
        description: 'This is a test product',
        category: 'Electronics',
        image: 'http://example.com/image.png',
        rating: rating,
      );

      const product2 = Product(
        id: 2,
        price: 199.99,
        title: 'Another Product',
        description: 'This is another product',
        category: 'Clothing',
        image: 'http://example.com/another-image.png',
        rating: Rating(rate: 3.0, count: 50),
      );

      expect(product1.hashCode != product2.hashCode, true);
    });
  });
}
