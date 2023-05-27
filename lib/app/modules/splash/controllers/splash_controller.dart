import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_op/app/routes/app_pages.dart';

import '../../../global_controller/location.controller.dart';

class SplashController extends GetxController {
  PageController pageViewController = PageController(initialPage: 0);

  List<String> images = [
    'assets/images/clean_night.png',
    'assets/images/rain.png',
    'assets/images/rainy.png',
    'assets/images/sunny_cloudy.png',
    'assets/images/synny.png',
    'assets/images/thunderstorm.png',
  ];

  @override
  void onInit() {
    _changeWeather();
    super.onInit();
  }

  void _changeWeather() async {
    await 500.milliseconds.delay();
    for (int a = 0; a != images.length + 1; a++) {
      if (a == images.length) {
        _navigateToHome();
        return;
      }
      await 400.milliseconds.delay();
      pageViewController.animateToPage(
        a,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  RxBool retry = false.obs;

  void retryPermission(){
    _navigateToHome();
  }

  void _navigateToHome() async {
    LocationServiceController locationServiceController = Get.find();
    bool result = await locationServiceController.getLocationPermission();
    if (result) {
      Get.offAllNamed(Routes.HOME);
    } else {
      retry.value = true;
    }
  }
}
