import 'package:dio/dio.dart';
import '../WeatherModel/WeatherModel.dart';

class DataService {
  Future<List<WeatherList>> getWeather() async {
    const url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=6.465422&lon=3.406448&cnt=5&appid=435993cb111961cf1411bdf830d30556&units=metric';
    final response = await Dio().get(url);
    final responseObject = WeatherModel.fromJson(response.data);
    return responseObject.list ?? [];
  }
}
