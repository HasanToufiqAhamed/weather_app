import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_op/app/modules/home/views/widget/hourly_weather_tile.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';
import 'package:weather_app_op/domain/core/model/daily_weather_ui_model.dart';

import '../../../../data/config/app_dimens.dart';
import '../../../../data/icons/weather_icon_icons.dart';

class DailyLoadingWeatherTile extends StatelessWidget {
  const DailyLoadingWeatherTile({
    Key? key,
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: AppDimens.padding4.circularRadius,
                        color: Colors.white24,
                      ),
                      child: Text(
                        'SAT',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.transparent,
                            ),
                      ),
                    ),
                    AppDimens.padding6.verticalSpacing,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: AppDimens.padding4.circularRadius,
                        color: Colors.white24,
                      ),
                      child: Text(
                        'Thursday',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.transparent,
                            ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppDimens.padding4.circularRadius,
                    color: Colors.white24,
                  ),
                  child: Icon(
                    WeatherIcon.a01d,
                    size: 32,
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppDimens.padding4.circularRadius,
                    color: Colors.white24,
                  ),
                  child: Text(
                    'Thursday',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.transparent,
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
                    flex: 3,
                    child: const SizedBox(),
                  ),
                  // Text('${weather.maxTemp}°C'),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: Get.width / 4.7,
                      color: Colors.white24,
                    ),
                  ),
                  // Text('${weather.minTemp}°C'),
                  Expanded(
                    flex: 3,
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
