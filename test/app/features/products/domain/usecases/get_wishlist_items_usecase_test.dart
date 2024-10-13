import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockWishlistRepository extends Mock implements WishlistRepository {}

void main() {
  late MockWishlistRepository mockWishlistRepository;
  late GetWishlistItemsUsecaseImpl usecase;

  setUp(() {
    mockWishlistRepository = MockWishlistRepository();
    usecase = GetWishlistItemsUsecaseImpl(repository: mockWishlistRepository);
  });

  group('GetWishlistItemsUsecase', () {
    final products = [
      Product(
        id: 1,
        price: 10.0,
        title: 'Product 1',
        description: 'Description 1',
        category: 'Category 1',
        image: 'image1.png',
        rating: const Rating(rate: 4.5, count: 100),
      ),
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

    test('should return a list of products from wishlist when successful', () {
      when(() => mockWishlistRepository.getWishlistItems())
          .thenReturn(Right(products));

      final result = usecase.call();

      expect(result.isRight(), true);
      verify(() => mockWishlistRepository.getWishlistItems()).called(1);
    });

    test('should return an Exception when getWishlistItems fails', () {
      when(() => mockWishlistRepository.getWishlistItems())
          .thenReturn(Left(Exception('Get wishlist error')));

      final result = usecase.call();

      expect(result.isLeft(), true);
      verify(() => mockWishlistRepository.getWishlistItems()).called(1);
    });
  });
}
