import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../../domain/core/abstractions/http_connect.interface.dart';
import '../../domain/core/abstractions/response.model.dart';

class Connect implements IHttpConnect {
  final GetConnect _connect;

  const Connect({required GetConnect connect}) : _connect = connect;

  @override
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _connect.get(
        url,
        decoder: decoder,
        headers: headers,
        query: query,
      );

      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      return obj;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> post<T>(
    String url,
    dynamic body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    try {
      final response =
          await _connect.post(url, body, decoder: decoder, headers: headers, query: query);

      debugPrint(response.hasError.toString());
      response.printError();
      debugPrint(response.status.code.toString());
      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      return obj;
    } catch (e) {
      debugPrint('${e.runtimeType}');
      rethrow;
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  }) async {
    final response = await _connect.patch(
      url,
      body,
      decoder: decoder,
      headers: headers,
    );
    final obj = Response(
      statusCode: response.statusCode!,
      payload: response.body,
    );
    return obj;
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? query,
  }) async {
    final response = await _connect.delete(
      url,
      decoder: decoder,
      headers: headers,
      query: query,
    );
    final obj = Response(
      statusCode: response.statusCode!,
      payload: response.body,
    );
    return obj;
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  }) async {
    final response = await _connect.put(
      url,
      body,
      decoder: decoder,
      headers: headers,
    );
    final obj = Response(
      statusCode: response.statusCode!,
      payload: response.body,
    );
    return obj;
  }
}
