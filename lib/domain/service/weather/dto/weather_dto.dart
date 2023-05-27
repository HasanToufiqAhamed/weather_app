import 'dart:convert';

class WeatherDto {
  String key;
  double latitude;
  double longitude;
  String units;

  WeatherDto({
    required this.key,
    required this.latitude,
    required this.longitude,
    required this.units,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['key'] = key;
    data['lat'] = latitude.toString();
    data['lon'] = longitude.toString();
    data['units'] = units;

    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
