import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../app.dart';

class DioClient implements AppHttpClient {
  DioClient({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);

    dio.httpClientAdapter = IOHttpClientAdapter();

    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  late final Dio dio;

  final _connectTimeout = const Duration(milliseconds: AppEnv.connectTimeout);
  final _receiveTimeout = const Duration(milliseconds: AppEnv.receiveTimeout);

  @override
  String baseUrl = AppEnv.baseUrl;

  @override
  Map<String, String> get baseHeaders => {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
        HttpHeaders.contentTypeHeader: Headers.jsonContentType,
      };

  BaseOptions get baseOptions => BaseOptions(
      headers: baseHeaders,
      baseUrl: baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout);

  @override
  Future<AppHttpResponse<T?>> get<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    String? apiVersion,
  }) async {
    final response = await dio.getUri(
      Uri.parse(url),
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> post<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  }) async {
    final response = await dio.postUri(
      Uri.parse(url),
      data: data,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> put<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  }) async {
    final response = await dio.putUri(
      Uri.parse(url),
      data: data,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> patch<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  }) async {
    final response = await dio.patchUri(
      Uri.parse(url),
      data: data,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> delete<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  }) async {
    final response = await dio.deleteUri(
      Uri.parse(url),
      data: data,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
