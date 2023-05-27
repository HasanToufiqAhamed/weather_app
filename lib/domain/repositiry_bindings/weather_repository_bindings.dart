import 'package:get/get.dart';

import '../repository/weather_repository.dart';
import '../service/connect.dart';
import '../service/weather/weather_network.dart';

class WeatherRepositoryBindings {
  late WeatherRepository _weatherRepository;

  WeatherRepository get repository => _weatherRepository;

  WeatherRepositoryBindings() {
    final GetConnect getConnect = Get.find<GetConnect>();
    final Connect connect = Connect(connect: getConnect);
    final weatherNetworkService = WeatherNetworkService(connect);
    _weatherRepository = WeatherRepository(
      weatherNetworkService: weatherNetworkService,
    );
  }
}
