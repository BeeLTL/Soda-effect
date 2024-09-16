import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData theme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xff1E1E1E),
          ),
          bodyMedium: TextStyle(
            color: Color(0xff1E1E1E),
          ),
          bodySmall: TextStyle(
            color: Color(0xff1E1E1E),
          )));
}
