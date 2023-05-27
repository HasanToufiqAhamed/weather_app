import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app_op/app/data/config/app_dimens.dart';
import 'package:weather_app_op/app/modules/home/views/widget/current_weather.dart';
import 'package:weather_app_op/app/modules/home/views/widget/daily_loading_weather_tile.dart';
import 'package:weather_app_op/app/modules/home/views/widget/daily_weather_tile.dart';
import 'package:weather_app_op/app/modules/home/views/widget/details_tile.dart';
import 'package:weather_app_op/app/modules/home/views/widget/home_widget_tile.dart';
import 'package:weather_app_op/app/modules/home/views/widget/hourly_loading_weather_tile.dart';
import 'package:weather_app_op/app/modules/home/views/widget/hourly_weather_tile.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(
          id: 'current',
          builder: (logic) {
            return Text(logic.currentWeather?.cityName ?? '');
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {

            },
            icon: const Icon(Icons.search_rounded),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('Celsius'),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text('Fahrenheit'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                controller.changeTempUnit(unit: 'M');
              } else if (value == 1) {
                controller.changeTempUnit(unit: 'I');
              }
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppDimens.primaryPadding,
          ),
          child: Column(
            children: [
              AppDimens.primaryPadding.verticalSpacing,
              GetBuilder<HomeController>(
                id: 'current',
                builder: (logic) {
                  return CurrentWeather(
                    currentWeather: logic.currentWeather,
                    unit: logic.tempUnit.value,
                  );
                },
              ),
              AppDimens.primaryPadding.verticalSpacing,
              Row(
                children: [
                  const Icon(CupertinoIcons.arrow_up),
                  Obx(() {
                    return Text(
                      '${controller.todayMaxTemp} °${controller.tempUnit.value.tempUnit}',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                    );
                  }),
                  AppDimens.primaryPadding.horizontalSpacing,
                  const Icon(CupertinoIcons.arrow_down),
                  Obx(() {
                    return Text(
                      '${controller.todayMinTemp} °${controller.tempUnit.value.tempUnit}',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                    );
                  }),
                ],
              ),
              (AppDimens.primaryPadding * 3).verticalSpacing,
              SizedBox(
                height: Get.height / 5.2,
                child: GetBuilder<HomeController>(
                  id: 'hourly',
                  builder: (logic) {
                    return HomeWidget(
                      title: 'Hourly forecast',
                      child: ListView.separated(
                        itemCount: logic.loadingHourlyWeather
                            ? 10
                            : logic.hourlyWeather.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: logic.loadingHourlyWeather
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.primaryPadding,
                        ),
                        itemBuilder: (context, index) {
                          if (logic.loadingHourlyWeather) {
                            return const HourlyLoadingWeatherTile();
                          }
                          var val = logic.hourlyWeather[index];
                          return HourlyWeatherTile(
                            weather: val,
                            unit: logic.tempUnit.value,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return AppDimens.primaryPadding.horizontalSpacing;
                        },
                      ),
                    );
                  },
                ),
              ),
              AppDimens.primaryPadding.verticalSpacing,
              SizedBox(
                height: Get.height / 2.1,
                child: GetBuilder<HomeController>(
                  id: 'daily',
                  builder: (logic) {
                    return HomeWidget(
                      bottomPadding: false,
                      title: 'Hourly forecast',
                      child: ListView.builder(
                        itemCount: logic.loadingDailyWeather
                            ? 10
                            : logic.dailyWeather.length,
                        physics: logic.loadingDailyWeather
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (logic.loadingDailyWeather) {
                            return const DailyLoadingWeatherTile();
                          }
                          var val = logic.dailyWeather[index];
                          return DailyWeatherTile(
                            weather: val,
                            maxTemp: logic.dailyMaxTemp,
                            minTemp: logic.dailyMinTemp,
                            unit: logic.tempUnit.value,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              AppDimens.primaryPadding.verticalSpacing,
              GetBuilder<HomeController>(
                id: 'current',
                builder: (logic) {
                  return HomeWidget(
                    bottomPadding: false,
                    expanded: false,
                    title: 'Details',
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.primaryPadding,
                      ),
                      itemCount: logic.detailsItem.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var val = logic.detailsItem[index];
                        return DetailsTime(details: val);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,//[grid]
                        childAspectRatio: 3,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
