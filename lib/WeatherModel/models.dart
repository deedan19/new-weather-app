class WeatherResponse {
  final String? cod;
  final int? message;
  final int? count;
  // final List<WeatherInfoMain>? list;

  WeatherResponse({this.cod, this.message, this.count});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    // final listJson = json['list'];
    // final listInfo = WeatherResponse.fromJson(listJson);

    final cod = json['cod'];
    final message = json['message'];
    final count = json['count'];
    //
    // final listJson = json['list'];
    // final listInfo = List<WeatherInfoMain>.fromJson

    return WeatherResponse(
      cod: cod,
      message: message,
      count: count,
      // list: list,
    );
  }
}

class WeatherInfoMain {
  final String? dt;
  final TemperatureInfo? main;
  final Weather? weather;

  WeatherInfoMain({this.dt, this.main, this.weather});
  factory WeatherInfoMain.fromJson(Map<String, dynamic> json) {
    final dt = json['dt'];

    final mainJson = json['main'];
    final mainInfo = TemperatureInfo.fromJson(mainJson);

    final weatherJson = json['weather'][0];
    final weatherInfo = Weather.fromJson(weatherJson);

    return WeatherInfoMain(dt: dt, main: mainInfo, weather: weatherInfo);
  }

  String? get iconUrl {
    return 'https://openweathermap.org/img/wn/${weather!.icon}@2x.png';
  }
}

class TemperatureInfo {
  final String? temp;
  TemperatureInfo({this.temp});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return TemperatureInfo(temp: temp);
  }
}

class Weather {
  final String? icon;
  Weather({this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final icon = json['icon'];
    return Weather(icon: icon);
  }
}
