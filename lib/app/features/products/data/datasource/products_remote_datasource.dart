import '../../../../app.dart';

abstract interface class ProductsRemoteDatasource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  ProductsRemoteDatasourceImpl({
    required AppHttpClient httpClient,
  }) : _httpClient = httpClient;
  final AppHttpClient _httpClient;

  static const _productsUrl = 'products';
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await _httpClient.get(_productsUrl);
    if (response.data == null) return [];

    return response.data
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  }
}
