import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockWishlistRepository extends Mock implements WishlistRepository {}

void main() {
  late MockWishlistRepository mockWishlistRepository;
  late ToggleWishlistItemUsecaseImpl usecase;

  setUp(() {
    mockWishlistRepository = MockWishlistRepository();
    usecase = ToggleWishlistItemUsecaseImpl(repository: mockWishlistRepository);
  });

  group('ToggleWishlistItemUsecase', () {
    final product = Product(
      id: 1,
      price: 10.0,
      title: 'Product 1',
      description: 'Description 1',
      category: 'Category 1',
      image: 'image1.png',
      rating: const Rating(rate: 4.5, count: 100),
    );

    test('should toggle wishlist item successfully', () async {
      when(() => mockWishlistRepository.toggleWishlistItem(product))
          .thenAnswer((_) async => const Right(null));

      final result = await usecase.call(product);

      expect(result.isRight(), true);
      verify(() => mockWishlistRepository.toggleWishlistItem(product))
          .called(1);
    });

    test('should return an Exception when toggle wishlist item fails',
        () async {
      when(() => mockWishlistRepository.toggleWishlistItem(product))
          .thenAnswer((_) async => Left(Exception('Toggle error')));

      final result = await usecase.call(product);

      expect(result.isLeft(), true);
      verify(() => mockWishlistRepository.toggleWishlistItem(product))
          .called(1);
    });
  });
}
