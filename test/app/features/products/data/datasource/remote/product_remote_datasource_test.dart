import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppHttpClient extends Mock implements AppHttpClient {}

void main() {
  late MockAppHttpClient mockHttpClient;
  late ProductRemoteDatasourceImpl datasource;

  setUp(() {
    mockHttpClient = MockAppHttpClient();
    datasource = ProductRemoteDatasourceImpl(httpClient: mockHttpClient);
  });

  group('ProductRemoteDatasourceImpl', () {
    const productsUrl = 'products';

    final productJson = {
      'id': 1,
      'title': 'Product 1',
      'description': 'Description 1',
    };

    final productModel = ProductModel(
      id: 1,
      title: 'Product 1',
      description: 'Description 1',
    );

    test('should return a list of ProductModel when the response is successful',
        () async {
      when(() => mockHttpClient.get(productsUrl)).thenAnswer(
        (_) async => AppHttpResponse(data: [productJson]),
      );

      final result = await datasource.fetchProducts();

      expect(result, [productModel]);
      verify(() => mockHttpClient.get(productsUrl)).called(1);
    });

    test('should return an empty list when the response data is null',
        () async {
      when(() => mockHttpClient.get(productsUrl)).thenAnswer(
        (_) async => AppHttpResponse(data: null),
      );

      final result = await datasource.fetchProducts();

      expect(result, isEmpty);
      verify(() => mockHttpClient.get(productsUrl)).called(1);
    });

    test('should return an empty list when the response data is an empty list',
        () async {
      when(() => mockHttpClient.get(productsUrl)).thenAnswer(
        (_) async => AppHttpResponse(data: []),
      );

      final result = await datasource.fetchProducts();

      expect(result, isEmpty);
      verify(() => mockHttpClient.get(productsUrl)).called(1);
    });
  });
}
