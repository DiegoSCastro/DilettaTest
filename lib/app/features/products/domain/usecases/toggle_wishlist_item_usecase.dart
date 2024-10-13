import 'package:fpdart/fpdart.dart';
import '../../../../app.dart';

abstract class ToggleWishlistItemUsecase {
  Future<Either<Exception, void>> call(Product product);
}

class ToggleWishlistItemUsecaseImpl implements ToggleWishlistItemUsecase {
  ToggleWishlistItemUsecaseImpl({required WishlistRepository repository})
      : _repository = repository;
  final WishlistRepository _repository;

  @override
  Future<Either<Exception, void>> call(Product product) {
    return _repository.toggleWishlistItem(product);
  }
}
