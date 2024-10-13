import 'dart:convert';
import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockLocalStorage mockLocalStorage;
  late WishlistLocalDatasourceImpl datasource;

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    datasource = WishlistLocalDatasourceImpl(localStorage: mockLocalStorage);
  });

  group('WishlistLocalDatasourceImpl', () {
    const wishlistKey = 'wishlist';

    final product = ProductModel(
      id: 1,
      title: 'Product 1',
      description: 'Description',
    );

    final productJson = json.encode(product.toJson());

    test('should toggle the product into the wishlist when not present',
        () async {
      when(() => mockLocalStorage.read<List<String>>(wishlistKey))
          .thenReturn([]);
      when(() => mockLocalStorage.write<List<String>>(wishlistKey, any()))
          .thenAnswer((_) async => {});

      await datasource.toggleWishlistItem(product);

      verify(() =>
              mockLocalStorage.write<List<String>>(wishlistKey, [productJson]))
          .called(1);
    });

    test('should remove the product from the wishlist if already present',
        () async {
      when(() => mockLocalStorage.read<List<String>>(wishlistKey))
          .thenReturn([productJson]);
      when(() => mockLocalStorage.write<List<String>>(wishlistKey, any()))
          .thenAnswer((_) async => {});

      await datasource.toggleWishlistItem(product);

      verify(() => mockLocalStorage.write<List<String>>(wishlistKey, []))
          .called(1);
    });

    test('should return an empty list when there is no wishlist saved', () {
      when(() => mockLocalStorage.read<List<String>>(wishlistKey))
          .thenReturn(null);

      // Act
      final result = datasource.getWishlistItems();

      expect(result, isEmpty);
    });

    test('should return the correct wishlist items', () {
      when(() => mockLocalStorage.read<List<String>>(wishlistKey))
          .thenReturn([productJson]);

      final result = datasource.getWishlistItems();

      expect(result, [product]);
    });
  });
}
