import 'dart:convert';

import 'package:http/http.dart' as http;
import '../WeatherModel/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // "https://api.openweathermap.org/data/2.5/weather?q=asaba&appid=435993cb111961cf1411bdf830d30556&units=metric"
    final queryParameters = {
      'lat': '6.465422',
      'lon': '3.406448',
      'appid': '435993cb111961cf1411bdf830d30556',
      'units': 'metric'
    };

    final uri = Uri.https(
        // api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
        'api.openweathermap.org',
        '/data/2.5/forecast?',
        queryParameters);

    final response = await http.get(uri);

    print('Body response::::: ${response.body}');
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
