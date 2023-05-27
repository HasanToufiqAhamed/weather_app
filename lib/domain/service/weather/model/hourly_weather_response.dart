class HourlyWeatherResponse {
  String? cityName;
  String? countryCode;
  List<Data>? data;
  num? lat;
  num? lon;
  String? stateCode;
  String? timezone;

  HourlyWeatherResponse(
      {this.cityName,
        this.countryCode,
        this.data,
        this.lat,
        this.lon,
        this.stateCode,
        this.timezone});

  HourlyWeatherResponse.fromJson(Map<String, dynamic> json) {
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
  num? appTemp;
  num? clouds;
  num? cloudsHi;
  num? cloudsLow;
  num? cloudsMid;
  String? datetime;
  num? dewpt;
  num? dhi;
  num? dni;
  num? ghi;
  num? ozone;
  String? pod;
  num? pop;
  num? precip;
  num? pres;
  num? rh;
  num? slp;
  num? snow;
  num? snowDepth;
  num? solarRad;
  num? temp;
  DateTime? timestampLocal;
  DateTime? timestampUtc;
  num? ts;
  num? uv;
  num? vis;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  num? windDir;
  num? windGustSpd;
  num? windSpd;

  Data(
      {this.appTemp,
        this.clouds,
        this.cloudsHi,
        this.cloudsLow,
        this.cloudsMid,
        this.datetime,
        this.dewpt,
        this.dhi,
        this.dni,
        this.ghi,
        this.ozone,
        this.pod,
        this.pop,
        this.precip,
        this.pres,
        this.rh,
        this.slp,
        this.snow,
        this.snowDepth,
        this.solarRad,
        this.temp,
        this.timestampLocal,
        this.timestampUtc,
        this.ts,
        this.uv,
        this.vis,
        this.weather,
        this.windCdir,
        this.windCdirFull,
        this.windDir,
        this.windGustSpd,
        this.windSpd});

  Data.fromJson(Map<String, dynamic> json) {
    appTemp = json['app_temp'];
    clouds = json['clouds'];
    cloudsHi = json['clouds_hi'];
    cloudsLow = json['clouds_low'];
    cloudsMid = json['clouds_mid'];
    datetime = json['datetime'];
    dewpt = json['dewpt'];
    dhi = json['dhi'];
    dni = json['dni'];
    ghi = json['ghi'];
    ozone = json['ozone'];
    pod = json['pod'];
    pop = json['pop'];
    precip = json['precip'];
    pres = json['pres'];
    rh = json['rh'];
    slp = json['slp'];
    snow = json['snow'];
    snowDepth = json['snow_depth'];
    solarRad = json['solar_rad'];
    temp = json['temp'];
    timestampLocal = DateTime.parse(json['timestamp_local']);
    timestampUtc = DateTime.parse(json['timestamp_utc']);
    ts = json['ts'];
    uv = json['uv'];
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
    data['app_temp'] = appTemp;
    data['clouds'] = clouds;
    data['clouds_hi'] = cloudsHi;
    data['clouds_low'] = cloudsLow;
    data['clouds_mid'] = cloudsMid;
    data['datetime'] = datetime;
    data['dewpt'] = dewpt;
    data['dhi'] = dhi;
    data['dni'] = dni;
    data['ghi'] = ghi;
    data['ozone'] = ozone;
    data['pod'] = pod;
    data['pop'] = pop;
    data['precip'] = precip;
    data['pres'] = pres;
    data['rh'] = rh;
    data['slp'] = slp;
    data['snow'] = snow;
    data['snow_depth'] = snowDepth;
    data['solar_rad'] = solarRad;
    data['temp'] = temp;
    data['timestamp_local'] = timestampLocal;
    data['timestamp_utc'] = timestampUtc;
    data['ts'] = ts;
    data['uv'] = uv;
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
