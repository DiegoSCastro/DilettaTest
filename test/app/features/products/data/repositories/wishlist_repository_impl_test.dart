import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWishlistLocalDatasource extends Mock
    implements WishlistLocalDatasource {}

void main() {
  late WishlistRepositoryImpl repository;
  late MockWishlistLocalDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockWishlistLocalDatasource();
    repository = WishlistRepositoryImpl(datasource: mockDatasource);
  });

  group('toggleWishlistItem', () {
    final product = Product(
      id: 1,
      price: 10.0,
      title: 'title',
      description: 'description',
      category: 'category',
      image: 'image',
      rating: Rating(
        rate: 5.0,
        count: 100,
      ),
    );
    final productModel = ProductModel.fromEntity(product);

    test('should call datasource to toggle wishlist item', () async {
      when(() => mockDatasource.toggleWishlistItem(productModel))
          .thenAnswer((_) async {});

      final result = await repository.toggleWishlistItem(product);

      expect(result.isRight(), true);
      verify(() => mockDatasource.toggleWishlistItem(productModel)).called(1);
    });

    test('should return an Exception when there is an error', () async {
      when(() => mockDatasource.toggleWishlistItem(productModel))
          .thenThrow(Exception('error'));

      final result = await repository.toggleWishlistItem(product);

      expect(result.isLeft(), true);
    });
  });

  group('getWishlistItems', () {
    final productModels = [
      ProductModel(id: 1, price: 10.0),
      ProductModel(id: 2, price: 20.0),
    ];

    test('should return a list of products when the call is successful', () {
      when(() => mockDatasource.getWishlistItems()).thenReturn(productModels);

      final result = repository.getWishlistItems();

      expect(result.isRight(), true);
    });

    test('should return an Exception when there is an error', () {
      when(() => mockDatasource.getWishlistItems())
          .thenThrow(Exception('error'));

      final result = repository.getWishlistItems();

      expect(result.isLeft(), true);
    });
  });
}
