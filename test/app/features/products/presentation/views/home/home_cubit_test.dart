import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockFetchProductsUsecase extends Mock implements FetchProductsUsecase {}

class MockToggleWishlistItemUsecase extends Mock
    implements ToggleWishlistItemUsecase {}

class MockGetWishlistItemsUsecase extends Mock
    implements GetWishlistItemsUsecase {}

void main() {
  late HomeCubit homeCubit;
  late MockFetchProductsUsecase mockFetchProductsUsecase;
  late MockToggleWishlistItemUsecase mockToggleWishlistItemUsecase;
  late MockGetWishlistItemsUsecase mockGetWishlistItemsUsecase;

  setUp(() {
    mockFetchProductsUsecase = MockFetchProductsUsecase();
    mockToggleWishlistItemUsecase = MockToggleWishlistItemUsecase();
    mockGetWishlistItemsUsecase = MockGetWishlistItemsUsecase();
    homeCubit = HomeCubit(
      fetchProductsUsecase: mockFetchProductsUsecase,
      toggleWishlistItemUsecase: mockToggleWishlistItemUsecase,
      getWishlistItemsUsecase: mockGetWishlistItemsUsecase,
    );
  });

  group('fetchProducts', () {
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
    ];

    test('should emit loading and then success when fetchProducts succeeds',
        () async {
      when(() => mockFetchProductsUsecase())
          .thenAnswer((_) async => Right(products));
      when(() => mockGetWishlistItemsUsecase()).thenReturn(Right([]));

      final expectedStates = [
        const HomeState.loading(),
        HomeState.success(
          products: products,
          filteredProducts: products,
          wishlist: [],
          searchText: '',
        ),
      ];

      expectLater(homeCubit.stream, emitsInOrder(expectedStates));

      await homeCubit.fetchProducts();
    });

    test('should emit loading and then error when fetchProducts fails',
        () async {
      when(() => mockFetchProductsUsecase())
          .thenAnswer((_) async => Left(Exception('Fetch error')));

      final expectedStates = [
        const HomeState.loading(),
        const HomeState.error(message: 'Exception: Fetch error'),
      ];

      expectLater(homeCubit.stream, emitsInOrder(expectedStates));

      await homeCubit.fetchProducts();
    });
  });

  group('toggleWishlistItem', () {
    final product = Product(
      id: 1,
      price: 10.0,
      title: 'Product 1',
      description: 'Description 1',
      category: 'Category 1',
      image: 'image1.png',
      rating: const Rating(rate: 4.5, count: 100),
    );

    test('should update wishlist when toggleWishlistItem succeeds', () async {
      when(() => mockToggleWishlistItemUsecase(product))
          .thenAnswer((_) async => const Right(null));
      when(() => mockGetWishlistItemsUsecase()).thenReturn(Right([product]));

      homeCubit.emit(HomeState.success(
          products: [product],
          wishlist: [],
          filteredProducts: [product],
          searchText: ''));

      await homeCubit.toggleWishlistItem(product);

      expect((homeCubit.state as HomeSuccess).wishlist, [product]);
    });
  });

  group('setSearchText', () {
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

    test('should filter products based on searchText', () {
      homeCubit.emit(HomeState.success(
          products: products,
          filteredProducts: products,
          wishlist: [],
          searchText: ''));

      homeCubit.setSearchText('Product 1');

      expect((homeCubit.state as HomeSuccess).filteredProducts, [products[0]]);
    });
  });

  group('isFavorite', () {
    final product = Product(
      id: 1,
      price: 10.0,
      title: 'Product 1',
      description: 'Description 1',
      category: 'Category 1',
      image: 'image1.png',
      rating: const Rating(rate: 4.5, count: 100),
    );

    test('should return true if product is in wishlist', () {
      homeCubit.emit(HomeState.success(
          products: [product],
          wishlist: [product],
          filteredProducts: [product],
          searchText: ''));

      final result = homeCubit.isFavorite(product.id);

      expect(result, true);
    });

    test('should return false if product is not in wishlist', () {
      homeCubit.emit(HomeState.success(
          products: [product],
          wishlist: [],
          filteredProducts: [product],
          searchText: ''));

      final result = homeCubit.isFavorite(product.id);

      expect(result, false);
    });
  });
}
