import 'package:flutter/material.dart';

import '../FiveDaysWeather/five_days_weather.dart';
import 'package:intl/intl.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  TextStyle? textStyle(
      {FontWeight? fontWeight = FontWeight.bold,
      double? textSize,
      Color? color = Colors.white}) {
    return TextStyle(fontWeight: fontWeight, color: color, fontSize: textSize);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEE d MMM').format(now);

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
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.list,
                size: 35.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'London,',
                    style:
                        textStyle(fontWeight: FontWeight.bold, textSize: 25.0),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'United Kingdom',
                    style:
                        textStyle(fontWeight: FontWeight.bold, textSize: 25.0),
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
              children: [
                const Text(
                  'Today',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.sunny,
                      size: 45.0,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '22º',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Sunny',
                  style:
                      textStyle(fontWeight: FontWeight.normal, textSize: 15.0),
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
                              color: Colors.grey),
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
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(24.0, 10.0, 0.0, 24.0),
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
                          itemCount: 7,
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
                                    '9AM',
                                    style: textStyle(
                                        fontWeight: FontWeight.normal,
                                        textSize: 15.0,
                                        color: Colors.white70),
                                  ),
                                  const Icon(
                                    Icons.sunny_snowing,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '16º',
                                    style: textStyle(
                                        fontWeight: FontWeight.normal,
                                        textSize: 15.0,
                                        color: Colors.white70),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
