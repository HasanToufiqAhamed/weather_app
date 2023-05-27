import 'package:get/get.dart';
import 'package:weather_app_op/domain/repositiry_bindings/weather_repository_bindings.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        weatherRepository: WeatherRepositoryBindings().repository,
      ),
    );
  }
}
