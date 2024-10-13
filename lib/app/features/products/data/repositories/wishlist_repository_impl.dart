import 'package:fpdart/fpdart.dart';

import '../../../../app.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl({
    required WishlistLocalDatasource datasource,
  }) : _datasource = datasource;

  final WishlistLocalDatasource _datasource;
  @override
  Future<Either<Exception, void>> toggleWishlistItem(Product product) async {
    try {
      await _datasource.toggleWishlistItem(ProductModel.fromEntity(product));
      return const Right(null);
    } catch (e) {
      return Left(Exception('Falha ao alternar wishlist: $e'));
    }
  }

  @override
  Either<Exception, List<Product>> getWishlistItems() {
    try {
      final wishlist = _datasource.getWishlistItems();
      final products =
          wishlist.map<Product>((product) => product.toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(Exception('Falha ao obter wishlist: $e'));
    }
  }
}
