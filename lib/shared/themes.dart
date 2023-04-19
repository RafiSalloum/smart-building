import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

// Color mainColor = HexColor("#d1e5e3");
Color mainColor = HexColor("#69B3AF");
Color secColor = HexColor("#C2DBB3");
// Color mainColor = HexColor("#498553");
// Color mainColor = HexColor("#08535D");


// MaterialColor buildMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map<int, Color> swatch = {};
//   final int r = color.red, g = color.green, b = color.blue;
//
//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   strengths.forEach((strength) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (r)) * ds).round(),
//       g + ((ds < 0 ? g : (g)) * ds).round(),
//       b + ((ds < 0 ? b : (b)) * ds).round(),
//       1,
//     );
//   });
//   return MaterialColor(color.value, swatch);
// }


ThemeData mainTheme()
{
  return ThemeData(
    useMaterial3: true,
      // colorSchemeSeed: const Color(0xffc53f3f),
    colorSchemeSeed: const Color(0xFF69B3AF),
    // primarySwatch: buildMaterialColor(HexColor("#222222")),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
    textTheme: const TextTheme(
      // Login First Description
      displayLarge: TextStyle(
        fontFamily: 'Mono',
        fontSize: 40.0,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Mono',
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
      headlineLarge: TextStyle(
        decoration: TextDecoration.underline,
        fontFamily: 'MonoB',
        fontSize: 24.0,
        color: Colors.black,
      ),
      // TFF Text
      bodyLarge: TextStyle(
        fontFamily: 'Mono',
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
      // Login Second Description + TFF hint
      displayMedium: TextStyle(
        fontFamily: 'Mono',
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
      // Elevated Button Theme + Selected Tabs
      headlineSmall: TextStyle(
        fontFamily: 'Mono',
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
      // Unselected tabs
      headlineMedium: TextStyle(
        fontFamily: 'Mono',
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Mono',
        fontSize: 22.0,
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
    // primarySwatch: buildMaterialColor(mainColor),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secColor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
      ),
      toolbarHeight: 70.0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: mainColor,
      elevation: 5.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: mainColor,
      ),
    ),
  );
}