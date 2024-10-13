import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.success({
    required List<Product> products,
    @Default([]) List<Product> filteredProducts,
    @Default([]) List<Product> wishlist,
    String? searchText,
  }) = HomeSuccess;

  const factory HomeState.error({required String message}) = HomeError;
}
