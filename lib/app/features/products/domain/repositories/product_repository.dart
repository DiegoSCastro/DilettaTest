import 'package:fpdart/fpdart.dart';

import '../../../../app.dart';

abstract interface class ProductRepository {
  Future<Either<Exception, List<Product>>> fetchProducts();
}
