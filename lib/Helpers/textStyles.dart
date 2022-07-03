import 'package:flutter/material.dart';

TextStyle? textStyle(
    {FontWeight? fontWeight = FontWeight.bold,
    double? textSize,
    Color? color = Colors.white}) {
  return TextStyle(fontWeight: fontWeight, color: color, fontSize: textSize);
}
