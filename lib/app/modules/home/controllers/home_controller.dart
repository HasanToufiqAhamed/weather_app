import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app_op/config.dart';
import 'package:weather_app_op/domain/service/weather/dto/weather_dto.dart';

import '../../../../domain/core/model/current_weather_ui_model.dart';
import '../../../../domain/core/model/daily_weather_ui_model.dart';
import '../../../../domain/core/model/details_ui_model.dart';
import '../../../../domain/core/model/hourly_weather_ui_model.dart';
import '../../../../domain/repository/weather_repository.dart';
import '../../../database/weather_database.dart';
import '../../../global_controller/location.controller.dart';

class HomeController extends GetxController {
  final WeatherRepository _weatherRepository;

  HomeController({
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  WeatherDatabase weatherDatabase = WeatherDatabase.instance;

  @override
  void onInit() {
    _getAllData();
    super.onInit();
  }

  void _getAllData() async {
    _getTempUnit();
    CurrentWeatherUIModel? localCurrentWeather =
    weatherDatabase.getCurrentWeather();

    if (localCurrentWeather != null) {
      currentWeather = localCurrentWeather;
    }

    update(['current']);
    LocationServiceController locationServiceController = Get.find();

    LatLng location = await locationServiceController.determinePosition();
    getCurrentWeather(location: location);
    getHourlyWeather(location: location);
    getDailyWeather(location: location);
  }


  void searchLocation({required double lat, required double lon}) {
    getCurrentWeather(location: LatLng(lat, lon));
    getHourlyWeather(location: LatLng(lat, lon));
    getDailyWeather(location: LatLng(lat, lon));
  }

  void changeTempUnit({required String unit}) async {
    await weatherDatabase.saveTempUnit(unit: unit);
    _getTempUnit();
    update(['current', 'hourly', 'daily']);
    _getAllData();
  }

  void _getTempUnit() {
    tempUnit.value = weatherDatabase.getTempUnit() ?? 'M';
  }

  RxString tempUnit = 'C'.obs;

  CurrentWeatherUIModel? currentWeather;
  List<DetailsUiModel> detailsItem = [];
  bool loadingCurrentWeather = true;

  void getCurrentWeather({required LatLng location}) async {
    try {
      loadingCurrentWeather = true;
      CurrentWeatherUIModel? localCurrentWeather =
          weatherDatabase.getCurrentWeather();

      if (localCurrentWeather != null) {
        this.currentWeather = localCurrentWeather;
      }

      update(['current']);

      WeatherDto dto = WeatherDto(
        key: ConfigEnvironments.apiKey,
        latitude: location.latitude,
        longitude: location.longitude,
        units: weatherDatabase.getTempUnit() ?? 'M',
      );
      CurrentWeatherUIModel currentWeather =
          await _weatherRepository.currentWeather(
        dto: dto,
      );
      this.currentWeather = currentWeather;

      weatherDatabase.saveCurrentWeather(currentWeather: this.currentWeather!);

      detailsItem.clear();
      for (int a = 0; a != 6; a++) {
        if (a == 0) {
          detailsItem.add(
            DetailsUiModel(
              title: 'Sunrise',
              value: this.currentWeather?.sunset ?? '',
            ),
          );
        } else if (a == 1) {
          detailsItem.add(
            DetailsUiModel(
              title: 'Sunset',
              value: this.currentWeather?.sunset ?? '',
            ),
          );
        } else if (a == 2) {
          detailsItem.add(
            DetailsUiModel(
              title: 'Humidity',
              value: '${this.currentWeather?.humidity ?? 0}%',
            ),
          );
        } else if (a == 3) {
          detailsItem.add(
            DetailsUiModel(
              title: 'Pressure',
              value: '${this.currentWeather?.pressure ?? 0} mb',
            ),
          );
        }
      }
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      loadingCurrentWeather = false;
      update(['current']);
    }
  }

  bool loadingHourlyWeather = true;
  List<HourlyWeatherUIModel> hourlyWeather = [];
  bool loadingDailyWeather = true;
  List<DailyWeatherUIModel> dailyWeather = [];

  void getHourlyWeather({required LatLng location}) async {
    try {
      loadingHourlyWeather = true;
      update(['hourly']);
      WeatherDto dto = WeatherDto(
        key: ConfigEnvironments.apiKey,
        latitude: location.latitude,
        longitude: location.longitude,
        units: weatherDatabase.getTempUnit() ?? 'M',
      );
      List<HourlyWeatherUIModel> hourlyWeather =
          await _weatherRepository.hourlyWeather(
        dto: dto,
      );
      this.hourlyWeather = hourlyWeather;
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      loadingHourlyWeather = false;
      update(['hourly']);
    }
  }

  num dailyMaxTemp = 0;
  num dailyMinTemp = 100;

  RxDouble todayMaxTemp = 0.0.obs;
  RxDouble todayMinTemp = 0.0.obs;

  void getDailyWeather({required LatLng location}) async {
    try {
      loadingDailyWeather = true;
      update(['daily']);
      dailyMaxTemp = 0;
      dailyMinTemp = 100;
      todayMaxTemp.value = 0.0;
      todayMinTemp.value = 0.0;
      this.dailyWeather.clear();

      WeatherDto dto = WeatherDto(
        key: ConfigEnvironments.apiKey,
        latitude: location.latitude,
        longitude: location.longitude,
        units: weatherDatabase.getTempUnit() ?? 'M',
      );
      List<DailyWeatherUIModel> dailyWeather =
          await _weatherRepository.dailyWeather(
        dto: dto,
      );
      if (dailyWeather.isNotEmpty) {
        todayMaxTemp.value = dailyWeather[0].maxTemp.toDouble();
        todayMinTemp.value = dailyWeather[0].minTemp.toDouble();

        for (int a = 0; a != 6; a++) {
          if (a != 0) {
            this.dailyWeather.add(dailyWeather[a]);
          }
        }
      }
      for (var val in this.dailyWeather) {
        if (dailyMaxTemp < val.maxTemp) {
          dailyMaxTemp = val.maxTemp.toInt();
        }
        if (dailyMinTemp > val.minTemp) {
          dailyMinTemp = val.minTemp.toInt();
        }
      }
      dailyMaxTemp = dailyMaxTemp + 5;
      dailyMinTemp = dailyMinTemp - 5;
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      loadingDailyWeather = false;
      update(['daily']);
    }
  }
}
