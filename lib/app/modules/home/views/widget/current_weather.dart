import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_op/app/modules/home/views/widget/probability_widget.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';
import 'package:weather_app_op/domain/core/model/current_weather_ui_model.dart';

import '../../../../data/config/app_dimens.dart';

class CurrentWeather extends StatelessWidget {
  final CurrentWeatherUIModel? currentWeather;
  final String unit;

  const CurrentWeather({
    Key? key,
    this.currentWeather,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${currentWeather?.temp ?? 0}',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      '°${unit.tempUnit}',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ProbabilityTile(
                  icon: const FaIcon(
                    FontAwesomeIcons.umbrella,
                    size: 16,
                  ),
                  value: '${'${currentWeather?.clouds ?? 0}'.nonZeroText}%',
                ),
                AppDimens.padding8.verticalSpacing,
                ProbabilityTile(
                  icon: const FaIcon(
                    FontAwesomeIcons.wind,
                    size: 16,
                  ),
                  value: '${'${currentWeather?.windSpd ?? 0}'.nonZeroText}m/s',
                ),
              ],
            ),
          ],
        ),
        if (currentWeather?.description == null)
          Container(
            decoration: BoxDecoration(
              borderRadius: AppDimens.padding4.circularRadius,
              color: Colors.white24,
            ),
            child: Text(
              '___________',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.transparent,
                  ),
            ),
          ),
        if (currentWeather?.description != null)
          Text(
            '${currentWeather?.description.toUpperCase()}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
      ],
    );
  }
}
