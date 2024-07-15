import 'package:flutter/material.dart';

class AppThemes {
  static const String fontFamily = 'Lato';

  static const Color main = Color.fromARGB(255, 18, 20, 24);
  static const Color mainDark = Color(0xFF0C0A0D);
  static const Color mainLight = Color.fromARGB(255, 25, 28, 32);
  static const Color scaffold = Color(0xFF000000);

  static const Color secondaryLight = Color(0xFFEB8729);
  static const Color secondaryDark = Color(0xFFD0491C);

  static const Color greenLight = Color(0xFF69C275);
  static const Color greenDark = Color(0xFF1D5B26);

  static const Color redLight = Color(0xFFEB2929);
  static const Color redDark = Color(0xFF761515);

  static const Color gray = Color(0xFFA0A0A0);
  static const Color whiteLight = Color(0xFFECECEC);
  static Color lighGrey = Colors.grey.shade900;

  static const Color fontMain = Color(0xFFD8D8D8);
  static const Color fontSecondary = Color(0xFF929292);

  static const List<Color> mainGradient = [mainLight, main];
  static const List<Color> secondaryGradient = [secondaryLight, secondaryDark];

  static lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: fontMain,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: fontMain, fontFamily: fontFamily),
          titleMedium: TextStyle(color: fontMain, fontFamily: fontFamily),
          titleSmall: TextStyle(color: fontMain, fontFamily: fontFamily),
        ),
        iconTheme: const IconThemeData(color: fontMain),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: main,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: fontMain,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: fontSecondary, fontFamily: fontFamily),
          titleMedium: TextStyle(color: fontMain, fontFamily: fontFamily),
          titleSmall: TextStyle(color: fontSecondary, fontFamily: fontFamily),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
