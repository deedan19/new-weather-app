import 'package:weather_app_forecast/Service/data_service.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherResponseCubit extends Cubit<WeatherResponseState> {
  WeatherResponseCubit() : super(LoadingState()) {
    getWeather();
  }

  final repository = DataService();

  Future<void> getWeather() async {
    try {
      final pokemon = await repository.getWeather();
      emit(SuccessState(pokemon));
    } catch (e) {
      emit(FailureState());
    }
  }
}
