import 'package:fpdart/fpdart.dart';
import '../../../../app.dart';

abstract class GetWishlistItemsUsecase {
  Either<Exception, List<Product>> call();
}

class GetWishlistItemsUsecaseImpl implements GetWishlistItemsUsecase {
  GetWishlistItemsUsecaseImpl({
    required WishlistRepository repository,
  }) : _repository = repository;
  final WishlistRepository _repository;

  @override
  Either<Exception, List<Product>> call() {
    return _repository.getWishlistItems();
  }
}
