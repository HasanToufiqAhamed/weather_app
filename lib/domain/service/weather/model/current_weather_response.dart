class CurrentWeatherResponse {
  num? count;
  List<Data>? data;

  CurrentWeatherResponse({this.count, this.data});

  CurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  num? appTemp;
  num? aqi;
  String? cityName;
  num? clouds;
  String? countryCode;
  String? datetime;
  num? dewpt;
  num? dhi;
  num? dni;
  num? elevAngle;
  num? ghi;
  num? hAngle;
  num? lat;
  num? lon;
  String? obTime;
  String? pod;
  num? precip;
  num? pres;
  num? rh;
  num? slp;
  num? snow;
  num? solarRad;
  List<String>? sources;
  String? stateCode;
  String? station;
  String? sunrise;
  String? sunset;
  num? temp;
  String? timezone;
  num? ts;
  num? uv;
  num? vis;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  num? windDir;
  num? windSpd;

  Data(
      {this.appTemp,
        this.aqi,
        this.cityName,
        this.clouds,
        this.countryCode,
        this.datetime,
        this.dewpt,
        this.dhi,
        this.dni,
        this.elevAngle,
        this.ghi,
        this.hAngle,
        this.lat,
        this.lon,
        this.obTime,
        this.pod,
        this.precip,
        this.pres,
        this.rh,
        this.slp,
        this.snow,
        this.solarRad,
        this.sources,
        this.stateCode,
        this.station,
        this.sunrise,
        this.sunset,
        this.temp,
        this.timezone,
        this.ts,
        this.uv,
        this.vis,
        this.weather,
        this.windCdir,
        this.windCdirFull,
        this.windDir,
        this.windSpd});

  Data.fromJson(Map<String, dynamic> json) {
    appTemp = json['app_temp'];
    aqi = json['aqi'];
    cityName = json['city_name'];
    clouds = json['clouds'];
    countryCode = json['country_code'];
    datetime = json['datetime'];
    dewpt = json['dewpt'];
    dhi = json['dhi'];
    dni = json['dni'];
    elevAngle = json['elev_angle'];
    ghi = json['ghi'];
    hAngle = json['h_angle'];
    lat = json['lat'];
    lon = json['lon'];
    obTime = json['ob_time'];
    pod = json['pod'];
    precip = json['precip'];
    pres = json['pres'];
    rh = json['rh'];
    slp = json['slp'];
    snow = json['snow'];
    solarRad = json['solar_rad'];
    sources = json['sources'].cast<String>();
    stateCode = json['state_code'];
    station = json['station'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    timezone = json['timezone'];
    ts = json['ts'];
    uv = json['uv'];
    vis = json['vis'];
    weather =
    json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    windCdir = json['wind_cdir'];
    windCdirFull = json['wind_cdir_full'];
    windDir = json['wind_dir'];
    windSpd = json['wind_spd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_temp'] = appTemp;
    data['aqi'] = aqi;
    data['city_name'] = cityName;
    data['clouds'] = clouds;
    data['country_code'] = countryCode;
    data['datetime'] = datetime;
    data['dewpt'] = dewpt;
    data['dhi'] = dhi;
    data['dni'] = dni;
    data['elev_angle'] = elevAngle;
    data['ghi'] = ghi;
    data['h_angle'] = hAngle;
    data['lat'] = lat;
    data['lon'] = lon;
    data['ob_time'] = obTime;
    data['pod'] = pod;
    data['precip'] = precip;
    data['pres'] = pres;
    data['rh'] = rh;
    data['slp'] = slp;
    data['snow'] = snow;
    data['solar_rad'] = solarRad;
    data['sources'] = sources;
    data['state_code'] = stateCode;
    data['station'] = station;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['timezone'] = timezone;
    data['ts'] = ts;
    data['uv'] = uv;
    data['vis'] = vis;
    if (weather != null) {
      data['weather'] = weather!.toJson();
    }
    data['wind_cdir'] = windCdir;
    data['wind_cdir_full'] = windCdirFull;
    data['wind_dir'] = windDir;
    data['wind_spd'] = windSpd;
    return data;
  }
}

class Weather {
  num? code;
  String? icon;
  String? description;

  Weather({this.code, this.icon, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['icon'] = icon;
    data['description'] = description;
    return data;
  }
}
