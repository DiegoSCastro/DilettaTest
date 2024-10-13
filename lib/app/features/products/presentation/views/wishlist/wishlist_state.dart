import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app.dart';

part 'wishlist_state.freezed.dart';

@freezed
sealed class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = WishlistInitial;

  const factory WishlistState.loading() = WishlistLoading;

  const factory WishlistState.success({
    @Default([]) List<Product> wishlist,
  }) = WishlistSuccess;

  const factory WishlistState.error({required String message}) = WishlistError;
}
