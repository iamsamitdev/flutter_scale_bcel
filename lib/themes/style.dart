import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

class AppTheme {

  //  Light Theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'IBMPlexSansThai',
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: accent,
    colorScheme: const ColorScheme.light(primary: primary),
    iconTheme: const IconThemeData(color: primaryText),
    scaffoldBackgroundColor: icons,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryText,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    )
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'IBMPlexSansThai',
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: accent,
    colorScheme: const ColorScheme.dark(primary: primary),
    iconTheme: const IconThemeData(color: icons),
    scaffoldBackgroundColor: primaryText,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: icons,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    )
  );

}