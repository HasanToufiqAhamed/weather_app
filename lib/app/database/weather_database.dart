import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../domain/core/model/current_weather_ui_model.dart';

class WeatherDatabase {
  static WeatherDatabase? _instance;

  WeatherDatabase._() {
    _instance = this;
  }

  static WeatherDatabase get instance => _instance ?? WeatherDatabase._();

  void init() async {
    await GetStorage.init(WeatherDBKeys.dbName);
  }

  Future<bool> saveCurrentWeather({
    required CurrentWeatherUIModel currentWeather,
  }) async {
    try {
      final storage = GetStorage(WeatherDBKeys.dbName);
      await storage.write(
          WeatherDBKeys.currentWeather, jsonEncode(currentWeather));
      await storage.save();
      return true;
    } catch (e) {
      return false;
    }
  }

  CurrentWeatherUIModel? getCurrentWeather() {
    try {
      final storage = GetStorage(WeatherDBKeys.dbName);
      var data = storage.read(WeatherDBKeys.currentWeather);
      if (data != null) {
        return CurrentWeatherUIModel.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  String? getTempUnit() {
    try {
      final storage = GetStorage(WeatherDBKeys.dbName);
      var data = storage.read(WeatherDBKeys.tempUnit);
      if (data != null) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveTempUnit({
    required String unit,
  }) async {
    try {
      final storage = GetStorage(WeatherDBKeys.dbName);
      await storage.write(WeatherDBKeys.tempUnit, unit);
      await storage.save();
      return true;
    } catch (e) {
      return false;
    }
  }
}

class WeatherDBKeys {
  static const dbName = 'weatherDB';
  static const tempUnit = 'tempUnit';
  static const currentWeather = 'currentWeather';
  static const dailyWeather = 'dailyWeather';
  static const hourlyWeather = 'hourlyWeather';
}
