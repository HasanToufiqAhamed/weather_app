import 'package:flutter/material.dart';
import 'package:weather_app_op/app/data/config/app_dimens.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';
import 'package:weather_app_op/domain/core/model/hourly_weather_ui_model.dart';

import '../../../../data/icons/weather_icon_icons.dart';

class HourlyLoadingWeatherTile extends StatelessWidget {
  const HourlyLoadingWeatherTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: AppDimens.padding4.circularRadius,
            color: Colors.white24,
          ),
          child: Text(
            '06 AM',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.transparent,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: AppDimens.padding4.circularRadius,
            color: Colors.white24,
          ),
          child: Icon(
            WeatherIcon.t01d,
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
            '25.5°C',
            style: TextStyle(
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
