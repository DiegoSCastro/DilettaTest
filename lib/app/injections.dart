import 'package:get_it/get_it.dart';

import 'app.dart';

final injection = GetIt.instance;

void createInjections() {
  injection
    ..registerLazySingleton<AppHttpClient>(DioClient.new)
    ..registerLazySingleton<LocalStorage>(LocalStorageImpl.new)
    ..registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDatasourceImpl(
        httpClient: injection<AppHttpClient>(),
      ),
    )
    ..registerLazySingleton<WishlistLocalDatasource>(
      () => WishlistLocalDatasourceImpl(
        localStorage: injection<LocalStorage>(),
      ),
    )
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        datasource: injection<ProductRemoteDatasource>(),
      ),
    )
    ..registerLazySingleton<WishlistRepository>(
      () => WishlistRepositoryImpl(
        datasource: injection<WishlistLocalDatasource>(),
      ),
    )
    ..registerLazySingleton<FetchProductsUsecase>(
      () => FetchProductsUsecaseImpl(
        repository: injection<ProductRepository>(),
      ),
    )
    ..registerLazySingleton<GetWishlistItemsUsecase>(
      () => GetWishlistItemsUsecaseImpl(
        repository: injection<WishlistRepository>(),
      ),
    )
    ..registerLazySingleton<ToggleWishlistItemUsecase>(
      () => ToggleWishlistItemUsecaseImpl(
        repository: injection<WishlistRepository>(),
      ),
    )
    ..registerFactory<HomeCubit>(
      () => HomeCubit(
        fetchProductsUsecase: injection<FetchProductsUsecase>(),
        getWishlistItemsUsecase: injection<GetWishlistItemsUsecase>(),
        toggleWishlistItemUsecase: injection<ToggleWishlistItemUsecase>(),
      ),
    )
    ..registerFactory<WishlistCubit>(
      () => WishlistCubit(
        getWishlistItemsUsecase: injection<GetWishlistItemsUsecase>(),
      ),
    );
  _initInjections();
}

void _initInjections() {
  injection<LocalStorage>().init();
}
