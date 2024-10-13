import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit({
    required GetWishlistItemsUsecase getWishlistItemsUsecase,
  })  : _getWishlistItemsUsecase = getWishlistItemsUsecase,
        super(const WishlistInitial());

  final GetWishlistItemsUsecase _getWishlistItemsUsecase;

  void fetchWishlistProducts() => _getWishlistItemsUsecase().fold(
        (error) => emit(WishlistState.error(message: error.toString())),
        (wishlist) {
          emit(WishlistState.success(wishlist: wishlist));
        },
      );
}
