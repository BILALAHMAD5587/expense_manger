import 'package:flutter/material.dart';

class MyColors {
  //light theme color

  static const Color bgWColor = Color(0xffffffff);
  static const Color secondryWColor = Color(0xfff1f0f3);
  static const Color textWColor = Color(0xff2c293c);
  static const Color LighttextWColor = Color(0xffb1b1b5);

  //dark theme color
  static const Color bgBColor = Color(0xff2c293c);
  static const Color secoundryBColor = Color(0xff737373);
  static const Color textBColor = Color(0xffffffff);
  static const Color LighttextBColor = Color(0xffcccccc);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];

  Map<int, Color> swatch = {};

  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;

    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

TextStyle mTextStylr52({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 52,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}

TextStyle mTextStylr43({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 43,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}

TextStyle mTextStylr26({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 26,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}

TextStyle mTextStylr19({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 19,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}

TextStyle mTextStylr16({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 16,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}

TextStyle mTextStylr12({
  mColor = Colors.green,
  fontweight = FontWeight.normal,
  fontStyle = FontStyle.normal,
}) {
  return TextStyle(
      color: mColor,
      fontWeight: fontweight,
      fontSize: 12,
      fontStyle: fontStyle,
      fontFamily: 'Quicksand');
}
