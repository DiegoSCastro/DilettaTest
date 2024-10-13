import 'dart:convert';

import '../../../../../app.dart';

abstract class WishlistLocalDatasource {
  Future<void> toggleWishlistItem(ProductModel product);
  List<ProductModel> getWishlistItems();
}

class WishlistLocalDatasourceImpl implements WishlistLocalDatasource {
  static const String _wishlistKey = 'wishlist';

  WishlistLocalDatasourceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  final LocalStorage _localStorage;
  @override
  Future<void> toggleWishlistItem(ProductModel product) async {
    final wishlist = getWishlistItems();
    final existingIndex = wishlist.indexWhere((item) => item.id == product.id);

    if (existingIndex != -1) {
      wishlist.removeAt(existingIndex);
    } else {
      wishlist.add(product);
    }

    final wishlistJson =
        wishlist.map((item) => json.encode(item.toJson())).toList();

    await _localStorage.write<List<String>>(_wishlistKey, wishlistJson);
  }

  @override
  List<ProductModel> getWishlistItems() {
    final wishlistJson = _localStorage.read<List<String>>(_wishlistKey);

    if (wishlistJson == null) return [];

    return wishlistJson
        .map((itemJson) => ProductModel.fromJson(json.decode(itemJson)))
        .toList();
  }
}
