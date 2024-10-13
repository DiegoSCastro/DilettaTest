import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dio/dio.dart';
import 'dart:async';

class MockProductRemoteDatasource extends Mock
    implements ProductRemoteDatasource {}

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockProductRemoteDatasource();
    repository = ProductRepositoryImpl(datasource: mockDatasource);
  });

  group('fetchProducts', () {
    test('should return a list of products when the call is successful',
        () async {
      final productModels = [
        ProductModel(id: 1, price: 10.0),
        ProductModel(id: 2, price: 20.0),
      ];

      when(() => mockDatasource.fetchProducts())
          .thenAnswer((_) async => productModels);

      final result = await repository.fetchProducts();

      expect(result.isRight(), true);
    });

    test('should return a DioException on DioException', () async {
      when(() => mockDatasource.fetchProducts())
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      final result = await repository.fetchProducts();

      expect(result.isLeft(), true);
    });

    test('should return a TimeoutException on TimeoutException', () async {
      when(() => mockDatasource.fetchProducts())
          .thenThrow(TimeoutException(''));

      final result = await repository.fetchProducts();

      expect(result.isLeft(), true);
    });

    test('should return a generic Exception on unknown errors', () async {
      when(() => mockDatasource.fetchProducts())
          .thenThrow(Exception('Unknown error'));

      final result = await repository.fetchProducts();

      expect(result.isLeft(), true);
    });
  });
}
