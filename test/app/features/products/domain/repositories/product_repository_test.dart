import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
  });

  group('ProductRepository', () {
    final products = [
      Product(
          id: 1,
          price: 10.0,
          title: 'Product 1',
          description: 'Description 1',
          category: 'Category 1',
          image: 'image1.png',
          rating: Rating(rate: 4.5, count: 100)),
      Product(
          id: 2,
          price: 20.0,
          title: 'Product 2',
          description: 'Description 2',
          category: 'Category 2',
          image: 'image2.png',
          rating: Rating(rate: 4.0, count: 50)),
    ];

    test('should return a list of products when fetchProducts is successful',
        () async {
      when(() => mockProductRepository.fetchProducts())
          .thenAnswer((_) async => Right(products));

      final result = await mockProductRepository.fetchProducts();

      expect(result.isRight(), true);
      verify(() => mockProductRepository.fetchProducts()).called(1);
    });

    test('should return an Exception when fetchProducts fails', () async {
      when(() => mockProductRepository.fetchProducts())
          .thenAnswer((_) async => Left(Exception('Fetch error')));

      final result = await mockProductRepository.fetchProducts();

      expect(result.isLeft(), true);
      verify(() => mockProductRepository.fetchProducts()).called(1);
    });
  });
}
