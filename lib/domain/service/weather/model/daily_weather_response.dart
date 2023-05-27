class DailyWeatherResponse {
  String? cityName;
  String? countryCode;
  List<Data>? data;
  num? lat;
  num? lon;
  String? stateCode;
  String? timezone;

  DailyWeatherResponse(
      {this.cityName,
        this.countryCode,
        this.data,
        this.lat,
        this.lon,
        this.stateCode,
        this.timezone});

  DailyWeatherResponse.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    countryCode = json['country_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    lat = json['lat'];
    lon = json['lon'];
    stateCode = json['state_code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_name'] = cityName;
    data['country_code'] = countryCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['state_code'] = stateCode;
    data['timezone'] = timezone;
    return data;
  }
}

class Data {
  num? appMaxTemp;
  num? appMinTemp;
  num? clouds;
  num? cloudsHi;
  num? cloudsLow;
  num? cloudsMid;
  DateTime? datetime;
  num? dewpt;
  num? highTemp;
  num? lowTemp;
  num? maxTemp;
  num? minTemp;
  num? moonPhase;
  num? moonPhaseLunation;
  num? moonriseTs;
  num? moonsetTs;
  num? ozone;
  num? pop;
  num? precip;
  num? pres;
  num? rh;
  num? slp;
  num? snow;
  num? snowDepth;
  num? sunriseTs;
  num? sunsetTs;
  num? temp;
  num? ts;
  num? uv;
  String? validDate;
  num? vis;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  num? windDir;
  num? windGustSpd;
  num? windSpd;

  Data(
      {this.appMaxTemp,
        this.appMinTemp,
        this.clouds,
        this.cloudsHi,
        this.cloudsLow,
        this.cloudsMid,
        this.datetime,
        this.dewpt,
        this.highTemp,
        this.lowTemp,
        this.maxTemp,
        this.minTemp,
        this.moonPhase,
        this.moonPhaseLunation,
        this.moonriseTs,
        this.moonsetTs,
        this.ozone,
        this.pop,
        this.precip,
        this.pres,
        this.rh,
        this.slp,
        this.snow,
        this.snowDepth,
        this.sunriseTs,
        this.sunsetTs,
        this.temp,
        this.ts,
        this.uv,
        this.validDate,
        this.vis,
        this.weather,
        this.windCdir,
        this.windCdirFull,
        this.windDir,
        this.windGustSpd,
        this.windSpd});

  Data.fromJson(Map<String, dynamic> json) {
    appMaxTemp = json['app_max_temp'];
    appMinTemp = json['app_min_temp'];
    clouds = json['clouds'];
    cloudsHi = json['clouds_hi'];
    cloudsLow = json['clouds_low'];
    cloudsMid = json['clouds_mid'];
    datetime = DateTime.parse(json['datetime']);
    dewpt = json['dewpt'];
    highTemp = json['high_temp'];
    lowTemp = json['low_temp'];
    maxTemp = json['max_temp'];
    minTemp = json['min_temp'];
    moonPhase = json['moon_phase'];
    moonPhaseLunation = json['moon_phase_lunation'];
    moonriseTs = json['moonrise_ts'];
    moonsetTs = json['moonset_ts'];
    ozone = json['ozone'];
    pop = json['pop'];
    precip = json['precip'];
    pres = json['pres'];
    rh = json['rh'];
    slp = json['slp'];
    snow = json['snow'];
    snowDepth = json['snow_depth'];
    sunriseTs = json['sunrise_ts'];
    sunsetTs = json['sunset_ts'];
    temp = json['temp'];
    ts = json['ts'];
    uv = json['uv'];
    validDate = json['valid_date'];
    vis = json['vis'];
    weather =
    json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    windCdir = json['wind_cdir'];
    windCdirFull = json['wind_cdir_full'];
    windDir = json['wind_dir'];
    windGustSpd = json['wind_gust_spd'];
    windSpd = json['wind_spd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_max_temp'] = appMaxTemp;
    data['app_min_temp'] = appMinTemp;
    data['clouds'] = clouds;
    data['clouds_hi'] = cloudsHi;
    data['clouds_low'] = cloudsLow;
    data['clouds_mid'] = cloudsMid;
    data['datetime'] = datetime;
    data['dewpt'] = dewpt;
    data['high_temp'] = highTemp;
    data['low_temp'] = lowTemp;
    data['max_temp'] = maxTemp;
    data['min_temp'] = minTemp;
    data['moon_phase'] = moonPhase;
    data['moon_phase_lunation'] = moonPhaseLunation;
    data['moonrise_ts'] = moonriseTs;
    data['moonset_ts'] = moonsetTs;
    data['ozone'] = ozone;
    data['pop'] = pop;
    data['precip'] = precip;
    data['pres'] = pres;
    data['rh'] = rh;
    data['slp'] = slp;
    data['snow'] = snow;
    data['snow_depth'] = snowDepth;
    data['sunrise_ts'] = sunriseTs;
    data['sunset_ts'] = sunsetTs;
    data['temp'] = temp;
    data['ts'] = ts;
    data['uv'] = uv;
    data['valid_date'] = validDate;
    data['vis'] = vis;
    if (weather != null) {
      data['weather'] = weather!.toJson();
    }
    data['wind_cdir'] = windCdir;
    data['wind_cdir_full'] = windCdirFull;
    data['wind_dir'] = windDir;
    data['wind_gust_spd'] = windGustSpd;
    data['wind_spd'] = windSpd;
    return data;
  }
}

class Weather {
  String? description;
  num? code;
  String? icon;

  Weather({this.description, this.code, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    code = json['code'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['code'] = code;
    data['icon'] = icon;
    return data;
  }
}
