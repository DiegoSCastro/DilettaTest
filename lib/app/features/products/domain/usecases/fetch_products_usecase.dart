import 'package:fpdart/fpdart.dart';

import '../../../../app.dart';

abstract interface class FetchProductsUsecase {
  Future<Either<Exception, List<Product>>> call();
}

class FetchProductsUsecaseImpl implements FetchProductsUsecase {
  final ProductRepository _repository;

  FetchProductsUsecaseImpl({required ProductRepository repository})
      : _repository = repository;
  @override
  Future<Either<Exception, List<Product>>> call() {
    return _repository.fetchProducts();
  }
}
