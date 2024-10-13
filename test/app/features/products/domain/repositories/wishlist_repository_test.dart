import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockWishlistRepository extends Mock implements WishlistRepository {}

void main() {
  late MockWishlistRepository mockWishlistRepository;

  setUp(() {
    mockWishlistRepository = MockWishlistRepository();
  });

  group('WishlistRepository', () {
    final product = Product(
      id: 1,
      price: 10.0,
      title: 'Product 1',
      description: 'Description 1',
      category: 'Category 1',
      image: 'image1.png',
      rating: const Rating(rate: 4.5, count: 100),
    );

    final products = [
      product,
      Product(
        id: 2,
        price: 20.0,
        title: 'Product 2',
        description: 'Description 2',
        category: 'Category 2',
        image: 'image2.png',
        rating: const Rating(rate: 4.0, count: 50),
      ),
    ];

    test('should toggle wishlist item successfully', () async {
      when(() => mockWishlistRepository.toggleWishlistItem(product))
          .thenAnswer((_) async => const Right(null));

      final result = await mockWishlistRepository.toggleWishlistItem(product);

      expect(result.isRight(), true);
      verify(() => mockWishlistRepository.toggleWishlistItem(product))
          .called(1);
    });

    test('should return an Exception when toggle wishlist fails', () async {
      when(() => mockWishlistRepository.toggleWishlistItem(product))
          .thenAnswer((_) async => Left(Exception('Toggle error')));

      final result = await mockWishlistRepository.toggleWishlistItem(product);

      expect(result.isLeft(), true);
      verify(() => mockWishlistRepository.toggleWishlistItem(product))
          .called(1);
    });

    test('should return wishlist items successfully', () {
      when(() => mockWishlistRepository.getWishlistItems())
          .thenReturn(Right(products));

      final result = mockWishlistRepository.getWishlistItems();

      expect(result.isRight(), true);
      verify(() => mockWishlistRepository.getWishlistItems()).called(1);
    });

    test('should return an Exception when get wishlist items fails', () {
      when(() => mockWishlistRepository.getWishlistItems())
          .thenReturn(Left(Exception('Get wishlist error')));

      final result = mockWishlistRepository.getWishlistItems();

      expect(result.isLeft(), true);
      verify(() => mockWishlistRepository.getWishlistItems()).called(1);
    });
  });
}
