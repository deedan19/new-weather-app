import 'package:flutter/material.dart';
import '../Helpers/textStyles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading...',
            style: textStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                textSize: 16.0),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
