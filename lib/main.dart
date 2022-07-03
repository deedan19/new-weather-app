import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_forecast/FiveDaysWeather/five_days_weather.dart';
import 'package:weather_app_forecast/WeatherHomePage/weather_home_page.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_cubit.dart';
import 'Service/data_service.dart';
import 'WeatherModel/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherResponseCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
