import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.activeBlue,
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.images.length,
        controller: controller.pageViewController,
        scrollBehavior: CupertinoScrollBehavior(),
        itemBuilder: (context, index) {
          String image=controller.images[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width/4),
            child: SizedBox(
              width: Get.width,
              child: Image.asset(image),
            ),
          );
        },
      ),
    );
  }
}
