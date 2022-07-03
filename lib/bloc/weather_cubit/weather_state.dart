import 'package:equatable/equatable.dart';
import 'package:weather_app_forecast/WeatherModel/WeatherModel.dart';
import 'package:weather_app_forecast/WeatherModel/models.dart';

abstract class WeatherResponseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends WeatherResponseState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends WeatherResponseState {
  final List<WeatherList>? result;
  SuccessState(this.result);
  @override
  List<Object?> get props => [];
}

class FailureState extends WeatherResponseState {
  @override
  List<Object?> get props => [];
}
