class DailyWeatherUIModel {
  num temp;
  num maxTemp;
  num minTemp;
  DateTime time;
  String icon;
  String description;

  DailyWeatherUIModel({
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.time,
    required this.icon,
    required this.description,
  });
}
