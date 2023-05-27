import '../core/model/current_weather_ui_model.dart';
import '../core/model/daily_weather_ui_model.dart';
import '../core/model/hourly_weather_ui_model.dart';
import '../service/weather/dto/weather_dto.dart';
import '../service/weather/model/current_weather_response.dart';
import '../service/weather/model/daily_weather_response.dart';
import '../service/weather/model/hourly_weather_response.dart';
import '../service/weather/weather_network.dart';

class WeatherRepository {
  final WeatherNetworkService _weatherNetworkService;

  WeatherRepository({
    required WeatherNetworkService weatherNetworkService,
  }) : _weatherNetworkService = weatherNetworkService;

  Future<CurrentWeatherUIModel> currentWeather({
    required WeatherDto dto,
  }) async {
    try {
      CurrentWeatherResponse response =
          await _weatherNetworkService.getCurrentTemp(
        dto: dto,
      );

      return CurrentWeatherUIModel(
        cityName: response.data![0].cityName!,
        datetime: response.data![0].datetime!,
        countryCode: response.data![0].countryCode!,
        sunrise: response.data![0].sunrise!,
        sunset: response.data![0].sunset!,
        windSpd: response.data![0].windSpd!,
        description: response.data![0].weather!.description!,
        elevAngle: response.data![0].elevAngle.toString(),
        temp: response.data![0].temp!,
        clouds: response.data![0].clouds!,
        humidity: response.data![0].rh ?? 0,
        pressure: response.data![0].pres ?? 0,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HourlyWeatherUIModel>> hourlyWeather({
    required WeatherDto dto,
  }) async {
    try {
      HourlyWeatherResponse response =
          await _weatherNetworkService.getHourlyTemp(
        dto: dto,
      );

      List<HourlyWeatherUIModel> list = [];

      if (response.data != null) {
        for (var val in response.data!) {
          list.add(
            HourlyWeatherUIModel(
                temp: val.temp!,
                time: val.timestampLocal!,
                icon: val.weather!.icon!),
          );
        }
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DailyWeatherUIModel>> dailyWeather({
    required WeatherDto dto,
  }) async {
    try {
      DailyWeatherResponse response = await _weatherNetworkService.getDailyTemp(
        dto: dto,
      );

      List<DailyWeatherUIModel> list = [];

      if (response.data != null) {
        for (var val in response.data!) {
          list.add(
            DailyWeatherUIModel(
              temp: val.temp!,
              time: val.datetime!,
              icon: val.weather!.icon!,
              maxTemp: val.maxTemp!,
              minTemp: val.minTemp!,
              description: val.weather?.description ?? '',
            ),
          );
        }
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
