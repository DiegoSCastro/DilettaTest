import '../../app.dart';

abstract interface class AppHttpClient {
  String get baseUrl;

  Map<String, String> get baseHeaders;

  Future<AppHttpResponse<T?>> get<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    String? apiVersion,
  });

  Future<AppHttpResponse<T?>> post<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  });

  Future<AppHttpResponse<T?>> put<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  });

  Future<AppHttpResponse<T?>> patch<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  });

  Future<AppHttpResponse<T?>> delete<T>(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? data,
    String? apiVersion,
  });
}
