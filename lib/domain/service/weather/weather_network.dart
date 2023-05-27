import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_op/domain/service/weather/dto/weather_dto.dart';
import 'package:weather_app_op/domain/service/weather/model/current_weather_response.dart';

import '../../core/abstractions/http_connect.interface.dart';
import '../../core/exceptions/default.exception.dart';
import 'model/daily_weather_response.dart';
import 'model/hourly_weather_response.dart';

class WeatherNetworkService {
  final IHttpConnect _connect;

  String get _prefix => 'v2.0';

  const WeatherNetworkService(IHttpConnect connect) : _connect = connect;

  Future<CurrentWeatherResponse> getCurrentTemp({
    required WeatherDto dto,
  }) async {
    try {
      final response = await _connect.get<CurrentWeatherResponse>(
        '$_prefix/current',
        query: dto.toJson(),
        headers: {
          'Accept': 'application/json',
        },
        decoder: (value) {
          return CurrentWeatherResponse.fromJson(
            value is String
                ? json.decode(value)
                : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        debugPrint('!!!!!!!!!!! ${response.statusCode}');
        switch (response.statusCode) {
          case 410:
            throw DefaultException(message: 'Something wrong');
          default:
            throw DefaultException(
              message: 'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<HourlyWeatherResponse> getHourlyTemp({
    required WeatherDto dto,
  }) async {
    try {
      final response = await _connect.get<HourlyWeatherResponse>(
        '$_prefix/forecast/hourly',
        query: dto.toJson(),
        headers: {
          'Accept': 'application/json',
        },
        decoder: (value) {
          return HourlyWeatherResponse.fromJson(
            value is String
                ? json.decode(value)
                : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 410:
            throw DefaultException(message: 'Something wrong');
          default:
            throw DefaultException(
              message: 'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DailyWeatherResponse> getDailyTemp({
    required WeatherDto dto,
  }) async {
    try {
      final response = await _connect.get<DailyWeatherResponse>(
        '$_prefix/forecast/daily',
        query: dto.toJson(),
        headers: {
          'Accept': 'application/json',
        },
        decoder: (value) {
          return DailyWeatherResponse.fromJson(
            value is String
                ? json.decode(value)
                : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 410:
            throw DefaultException(message: 'Something wrong');
          default:
            throw DefaultException(
              message: 'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
