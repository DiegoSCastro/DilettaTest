import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _datasource;

  ProductRepositoryImpl({required ProductRemoteDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<Exception, List<Product>>> fetchProducts() async {
    try {
      final response = await _datasource.fetchProducts();
      final products =
          response.map<Product>((product) => product.toEntity()).toList();

      return Right(products);
    } on DioException catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Exception(e.toString()));
    } on TimeoutException catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(TimeoutException(e.toString()));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return Left(Exception(e.toString()));
    }
  }
}
