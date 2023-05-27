import './response.model.dart';

abstract class IHttpConnect {
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? query,
  });

  Future<Response<T>> post<T>(
    String url,
    // Map<String, dynamic> body,
    dynamic body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? query,
  });

  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  });

  Future<Response<T>> patch<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  });

  Future<Response<T>> delete<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? query,
  });
}
