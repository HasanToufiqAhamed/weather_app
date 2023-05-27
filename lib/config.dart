import 'package:google_maps_flutter/google_maps_flutter.dart';

/// app development state
class Environments {
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

/// config data class
class ConfigEnvironments {
  static const String currentEnvironments = Environments.DEV;
  static const LatLng offLocation = LatLng(0, 0);
  static const String apiKey = 'xxxxxxxxxxx';
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': '',
    },
    {
      'env': Environments.DEV,
      'url': 'https://api.weatherbit.io/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironments,
      orElse: () => _availableEnvironments[1],
    );
  }
}
