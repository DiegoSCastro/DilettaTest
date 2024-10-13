import 'package:fpdart/fpdart.dart';

import '../../../../app.dart';

abstract class WishlistRepository {
  Future<Either<Exception, void>> toggleWishlistItem(Product product);
  Either<Exception, List<Product>> getWishlistItems();
}
