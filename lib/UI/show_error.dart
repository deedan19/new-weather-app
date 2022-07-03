import 'package:flutter/material.dart';
import '../Helpers/textStyles.dart';

class ShowError extends StatelessWidget {
  const ShowError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            size: 40.0,
            color: Colors.red,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Error loading weather information",
            style: textStyle(
                fontWeight: FontWeight.w500, color: Colors.red, textSize: 20.0),
          ),
        ],
      ),
    );
  }
}
