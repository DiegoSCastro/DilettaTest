import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeState', () {
    const products = [
      Product(
        id: 1,
        price: 10.0,
        title: 'Product 1',
        description: 'Description 1',
        category: 'Category 1',
        image: 'image1.png',
        rating: Rating(rate: 4.5, count: 100),
      ),
      Product(
        id: 2,
        price: 20.0,
        title: 'Product 2',
        description: 'Description 2',
        category: 'Category 2',
        image: 'image2.png',
        rating: Rating(rate: 4.0, count: 50),
      ),
    ];

    test('should create initial state', () {
      const state = HomeState.initial();
      expect(state, isA<HomeInitial>());
    });

    test('should create loading state', () {
      const state = HomeState.loading();
      expect(state, isA<HomeLoading>());
    });

    test('should create success state', () {
      const state = HomeState.success(
        products: products,
        filteredProducts: products,
        wishlist: [],
        searchText: 'Test Search',
      );

      expect(state, isA<HomeSuccess>());
      expect((state as HomeSuccess).products, products);
      expect(state.filteredProducts, products);
      expect(state.wishlist, isEmpty);
      expect(state.searchText, 'Test Search');
    });

    test('should create error state', () {
      const state = HomeState.error(message: 'An error occurred');
      expect(state, isA<HomeError>());
      expect((state as HomeError).message, 'An error occurred');
    });

    test('should support value equality for success state', () {
      const state1 = HomeState.success(
        products: [],
        filteredProducts: [],
        wishlist: [],
        searchText: 'Test Search',
      );

      const state2 = HomeState.success(
        products: [],
        filteredProducts: [],
        wishlist: [],
        searchText: 'Test Search',
      );

      expect(state1, state2);
    });

    test('should have different hashcodes for different states', () {
      const state1 = HomeState.error(message: 'Error 1');
      const state2 = HomeState.error(message: 'Error 2');

      expect(state1.hashCode != state2.hashCode, true);
    });
  });
}
