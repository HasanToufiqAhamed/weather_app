class CurrentWeatherUIModel {
  late String cityName;
  late String datetime;
  late String countryCode;
  late String sunrise;
  late String sunset;
  late num windSpd;
  late String description;
  late String elevAngle;
  late num temp;
  late num clouds;
  late num humidity;
  late num pressure;

  CurrentWeatherUIModel({
    required this.cityName,
    required this.datetime,
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
    required this.windSpd,
    required this.description,
    required this.elevAngle,
    required this.temp,
    required this.clouds,
    required this.humidity,
    required this.pressure,
  });

  CurrentWeatherUIModel.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    datetime = json['datetime'];
    countryCode = json['countryCode'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    windSpd = json['windSpd'];
    description = json['description'];
    elevAngle = json['elevAngle'];
    temp = json['temp'];
    clouds = json['clouds'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cityName'] = cityName;
    data['datetime'] = datetime;
    data['countryCode'] = countryCode;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['windSpd'] = windSpd;
    data['description'] = description;
    data['elevAngle'] = elevAngle;
    data['temp'] = temp;
    data['clouds'] = clouds;
    data['humidity'] = humidity;
    data['pressure'] = pressure;
    return data;
  }
}
