import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Initializer().init();

  runApp(
    GetMaterialApp(
      title: 'Weather App OP',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        brightness: Brightness.dark,
      ),
    ),
  );
}
