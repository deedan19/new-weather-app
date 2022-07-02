import 'package:flutter/material.dart';

class FiveDaysWeatherScreen extends StatelessWidget {
  const FiveDaysWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
              itemCount: 15,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: const Text(
                    'Mondays',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  trailing: Wrap(
                    children: const [
                      Icon(Icons.add_box),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        '12º',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
