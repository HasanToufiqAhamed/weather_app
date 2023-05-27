import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:weather_app_op/app/modules/home/views/widget/hourly_weather_tile.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';
import 'package:weather_app_op/domain/core/model/daily_weather_ui_model.dart';

import '../../../../data/config/app_dimens.dart';
import '../../../../data/icons/weather_icon_icons.dart';

class DailyWeatherTile extends StatelessWidget {
  final DailyWeatherUIModel weather;
  final num minTemp;
  final num maxTemp;
  final String unit;

  const DailyWeatherTile({
    Key? key,
    required this.weather,
    required this.maxTemp,
    required this.minTemp,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 4.7,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(weather.time.dayNameDateFormat,
                        style: Theme.of(context).textTheme.bodyLarge),
                    AppDimens.padding6.verticalSpacing,
                    Text(
                      weather.time.dailyDateFormat,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Icon(
                  getWeatherIcon(
                    icon: weather.icon,
                  ),
                  size: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding12,
                  ),
                  child: TextScroll(
                    weather.description,
                    velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
                    delayBefore: const Duration(seconds: 2),
                    numberOfReps: 5,
                    pauseBetween: const Duration(seconds: 2),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white70,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    flex: (maxTemp - weather.maxTemp).toInt(),
                    child: const SizedBox(),
                  ),
                  Text('${weather.maxTemp}°${unit.tempUnit}'),
                  Expanded(
                    flex: ((weather.maxTemp - weather.minTemp)).toInt(),
                    child: Container(
                      width: Get.width / 4.7,
                      color: Colors.white24,
                    ),
                  ),
                  Text('${weather.minTemp}°${unit.tempUnit}'),
                  Expanded(
                    flex: (weather.minTemp - minTemp).toInt(),
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
