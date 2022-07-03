import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_cubit.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_state.dart';

import '../Helpers/textStyles.dart';

class FiveDaysWeatherScreen extends StatelessWidget {
  const FiveDaysWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherResponseCubit, WeatherResponseState>(
          builder: (context, state) {
        if (state is SuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Next 7 Days',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.result?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text(
                        'Mondays',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      trailing: Wrap(
                        children: [
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://openweathermap.org/img/wn/${state.result?[index].weather?[0].icon}@2x.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            '${state.result?[index].main?.temp}º',
                            style: textStyle(
                                fontWeight: FontWeight.bold,
                                textSize: 18.0,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is LoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading...',
                  style: textStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                      textSize: 16.0),
                ),
                const CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ],
            ),
          );
        }
        return Center(
          child: Text(
            "Error loading weather data",
            style: textStyle(
                fontWeight: FontWeight.w500, color: Colors.red, textSize: 20.0),
          ),
        );
      }),
    );
  }
}
