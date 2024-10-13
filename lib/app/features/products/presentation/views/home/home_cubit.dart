import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required FetchProductsUsecase fetchProductsUsecase,
    required ToggleWishlistItemUsecase toggleWishlistItemUsecase,
    required GetWishlistItemsUsecase getWishlistItemsUsecase,
  })  : _fetchProductsUsecase = fetchProductsUsecase,
        _toggleWishlistItemUsecase = toggleWishlistItemUsecase,
        _getWishlistItemsUsecase = getWishlistItemsUsecase,
        super(const HomeState.initial());

  final FetchProductsUsecase _fetchProductsUsecase;
  final ToggleWishlistItemUsecase _toggleWishlistItemUsecase;
  final GetWishlistItemsUsecase _getWishlistItemsUsecase;

  Future<void> fetchProducts() async {
    emit(const HomeState.loading());
    final result = await _fetchProductsUsecase();
    result.fold(
      (error) => emit(HomeState.error(message: error.toString())),
      (products) {
        emit(HomeState.success(
          products: products,
          filteredProducts: products,
          searchText: '',
        ));
        updateWidhlist();
      },
    );
  }

  void setSearchText(String searchText) {
    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;
      final filteredProducts = currentState.products
          .where(
            (e) => e.title.withoutDiacriticalLowerCase
                .contains(searchText.withoutDiacriticalLowerCase),
          )
          .toList();
      emit(currentState.copyWith(
        searchText: searchText,
        filteredProducts: filteredProducts,
      ));
    }
  }

  Future<void> toggleWishlistItem(Product product) async {
    final result = await _toggleWishlistItemUsecase(product);
    result.fold(
      (_) => null,
      (_) => updateWidhlist(),
    );
  }

  void updateWidhlist() {
    final favoritesResult = _getWishlistItemsUsecase();
    favoritesResult.fold((error) => null, (wishlist) {
      if (state is HomeSuccess) {
        emit(
          (state as HomeSuccess).copyWith(wishlist: wishlist),
        );
      }
    });
  }

  bool isFavorite(int productId) {
    if (state is! HomeSuccess) {
      return false;
    }
    return (state as HomeSuccess).wishlist.any((item) => item.id == productId);
  }
}
