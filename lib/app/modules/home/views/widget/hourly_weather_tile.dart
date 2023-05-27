import 'package:flutter/material.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';
import 'package:weather_app_op/domain/core/model/hourly_weather_ui_model.dart';

import '../../../../data/icons/weather_icon_icons.dart';

class HourlyWeatherTile extends StatelessWidget {
  final HourlyWeatherUIModel weather;
  final String unit;

  const HourlyWeatherTile({
    Key? key,
    required this.weather,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(weather.time.hourlyDateFormat, style: Theme.of(context).textTheme.bodySmall,),
        Icon(
          getWeatherIcon(
            icon: weather.icon,
          ),
          size: 32,
        ),
        Text('${weather.temp.toString().nonZeroText}°${unit.tempUnit}')
      ],
    );
  }
}

IconData getWeatherIcon({required String icon}) {
  switch (icon) {
    case 't01d':
      return WeatherIcon.t01d;
    case 't01n':
      return WeatherIcon.t01n;
    case 't02d':
      return WeatherIcon.t02d;
    case 't02n':
      return WeatherIcon.t02n;
    case 't03d':
      return WeatherIcon.t03d;
    case 't03n':
      return WeatherIcon.t03n;
    case 't04d':
      return WeatherIcon.t04d;
    case 't04n':
      return WeatherIcon.t04n;
    case 't05d':
      return WeatherIcon.t05d;
    case 't05n':
      return WeatherIcon.t05n2;
    case 'd01d':
      return WeatherIcon.d01d;
    case 'd01n':
      return WeatherIcon.d01n;
    case 'd02d':
      return WeatherIcon.d02d;
    case 'd02n':
      return WeatherIcon.d02n;
    case 'd03d':
      return WeatherIcon.d03d;
    case 'd03n':
      return WeatherIcon.d03n;
    case 'r01d':
      return WeatherIcon.r01d;
    case 'r01n':
      return WeatherIcon.r01n;
    case 'r02d':
      return WeatherIcon.r02d;
    case 'r02n':
      return WeatherIcon.r02n;
    case 'r03d':
      return WeatherIcon.r03d;
    case 'r03n':
      return WeatherIcon.r03n;
    case 'f01d':
      return WeatherIcon.f01d;
    case 'f01n':
      return WeatherIcon.f01n;
    case 'r04d':
      return WeatherIcon.r04d;
    case 'r04n':
      return WeatherIcon.r04n;
    case 'r05d':
      return WeatherIcon.r05d;
    case 'r05n':
      return WeatherIcon.r05n;
    case 'r06d':
      return WeatherIcon.r06d;
    case 'r06n':
      return WeatherIcon.r06n;

    case 's01d':
      return WeatherIcon.s01d;
    case 's01n':
      return WeatherIcon.s01n;
    case 's02d':
      return WeatherIcon.s02d;
    case 's02n':
      return WeatherIcon.s02n;
    case 's03d':
      return WeatherIcon.s03d;
    case 's03n':
      return WeatherIcon.s03n;
    case 's04d':
      return WeatherIcon.s04d;
    case 's04n':
      return WeatherIcon.s04n;
    case 's05d':
      return WeatherIcon.s05d;
    case 's05n':
      return WeatherIcon.s05n;

    case 'a01d':
      return WeatherIcon.a01d;
    case 'a01n':
      return WeatherIcon.a01n;
    case 'a02d':
      return WeatherIcon.a02d;
    case 'a02n':
      return WeatherIcon.a02n;
    case 'a03d':
      return WeatherIcon.a03d;
    case 'a03n':
      return WeatherIcon.a03n;
    case 'a04d':
      return WeatherIcon.a04d;
    case 'a04n':
      return WeatherIcon.a04n;
    case 'a05d':
      return WeatherIcon.a05d;
    case 'a05n':
      return WeatherIcon.a05n;

    case 'c01d':
      return WeatherIcon.c01d;
    case 'c01n':
      return WeatherIcon.c01n;
    case 'c02d':
      return WeatherIcon.c02d;
    case 'c02n':
      return WeatherIcon.c02n;
    case 'c03d':
      return WeatherIcon.c03d;
    case 'c03n':
      return WeatherIcon.c03n;
    case 'c04d':
      return WeatherIcon.c04d;
    case 'c04n':
      return WeatherIcon.c04n;

    case 'u01d':
      return WeatherIcon.r06d;
    case 'u01n':
      return WeatherIcon.r06n;


    default:
      return WeatherIcon.a01d;
  }
}
