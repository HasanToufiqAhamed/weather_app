import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_op/app/routes/app_pages.dart';

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
    for (int a = 0; a != images.length + 1; a++) {
      if (a == images.length) {
        Get.offAllNamed(Routes.HOME);
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
}
