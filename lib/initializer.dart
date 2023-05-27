import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app_op/app/utils/widgets/loader/loading.controller.dart';
import 'package:get_storage/get_storage.dart';

import 'app/database/weather_database.dart';
import 'app/global_controller/location.controller.dart';
import 'config.dart';

class Initializer {
  Future<void> init() async {
    await _initStorage();
    _initGetConnect();
    _initGlobalLoading();
    await _initBinding();
  }

  /// local storage
  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());

    _initAllStorage();
  }

  static _initAllStorage() async {
    await GetStorage.init(WeatherDBKeys.dbName);
    WeatherDatabase.instance.init();
  }

  /// global loader
  static void _initGlobalLoading() {
    final loading = LoadingController();
    Get.put(loading);
  }

  /// http client
  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 30);
    connect.httpClient.maxAuthRetries = 0;
    connect.httpClient.addRequestModifier<dynamic>(
      (request) {
        return request;
      },
    );

    connect.httpClient.addResponseModifier(
      (request, response) async {
        debugPrint('request to:=> ${request.url}');
        return response;
      },
    );
    Get.put(connect);
  }

  /// initialBindings
  Future _initBinding() async {
    Get.put(LocationServiceController());
  }
}
