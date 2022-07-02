class WeatherInfoMain {
  final String? dt;
  final String? main;
  final Weather? weather;

  WeatherInfoMain({this.dt, this.main, this.weather});
  factory WeatherInfoMain.fromJson(Map<String, dynamic> json) {
    final dt = json['dt'];
    final main = json['main'];
    final weather = json['weather'][0];
    return WeatherInfoMain(dt: dt, main: main, weather: weather);
  }

  String? get iconUrl {
    return 'https://openweathermap.org/img/wn/${weather!.icon}@2x.png';
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

class WeatherResponse {
  final List<WeatherInfoMain>? list;

  WeatherResponse({this.list});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final listJson = json['list'];
    final listInfo = WeatherResponse.fromJson(listJson);

    return WeatherResponse(
        // list: listInfo,
        );
  }
}
