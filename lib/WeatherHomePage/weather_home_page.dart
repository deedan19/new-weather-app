import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_forecast/Helpers/formatter.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_cubit.dart';
import 'package:weather_app_forecast/bloc/weather_cubit/weather_state.dart';
import '../Helpers/textStyles.dart';
import 'package:intl/intl.dart';

import '../UI/FiveDaysWeather/five_days_weather.dart';
import '../UI/load_screen.dart';
import '../UI/show_error.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('EEE d MMM').format(
      DateTime.now(),
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3971f0), Color(0xff729efe)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FiveDaysWeatherScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.list,
                size: 35.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocBuilder<WeatherResponseCubit, WeatherResponseState>(
            builder: (context, state) {
          if (state is SuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lagos,',
                        style: textStyle(
                            fontWeight: FontWeight.bold, textSize: 25.0),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Nigeria',
                        style: textStyle(
                            fontWeight: FontWeight.bold, textSize: 25.0),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        formattedDate,
                        style: textStyle(
                            fontWeight: FontWeight.normal, textSize: 15.0),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://openweathermap.org/img/wn/${state.result?[0].weather?[0].icon}@2x.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '${state.result?[0].main?.temp?.toInt()}º',
                          style: textStyle(
                              fontWeight: FontWeight.bold,
                              textSize: 25.0,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${state.result?[0].weather?[0].description}',
                      style: textStyle(
                          fontWeight: FontWeight.normal, textSize: 15.0),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Row(
                          children: [
                            Text(
                              'Today',
                              style: textStyle(
                                  fontWeight: FontWeight.w500, textSize: 18.0),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'Tomorrow',
                              style: textStyle(
                                  fontWeight: FontWeight.w400,
                                  textSize: 18.0,
                                  color: Colors.blueGrey),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FiveDaysWeatherScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Next 7 days →',
                                style: textStyle(
                                    fontWeight: FontWeight.w400,
                                    textSize: 18.0,
                                    color: Colors.blueGrey),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(24.0, 10.0, 0.0, 24.0),
                          decoration: const BoxDecoration(
                            color: Color(0xff75a0ff),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.result?.length,
                                itemBuilder: (context, index) => Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          Formatter.formatTimeOfDay(
                                              '${state.result?[index].dtTxt}'),
                                          style: textStyle(
                                              fontWeight: FontWeight.normal,
                                              textSize: 15.0,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://openweathermap.org/img/wn/${state.result?[index].weather?[0].icon}@2x.png'),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${state.result?[index].main?.temp?.toInt()}º',
                                          style: textStyle(
                                              fontWeight: FontWeight.normal,
                                              textSize: 15.0,
                                              color: Colors.white70),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          if (state is LoadingState) {
            return const LoadingScreen();
          }
          return const ShowError();
        }),
      ),
    );
  }
}
