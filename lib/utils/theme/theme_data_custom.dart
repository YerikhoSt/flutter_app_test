import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/config.dart';

class ThemeDataCustom {
  ThemeDataCustom();

  static ThemeData dark = ThemeData(
    indicatorColor: Config.whiteColor,
    focusColor: Config.blackColor,
    cardColor: Config.darkSecondaryBackground,
    dividerColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    shadowColor: Config.whiteColor,
    brightness: Brightness.dark,
    backgroundColor: Config.darkBackground,
    primaryColor: Config.darkPrimaryColor,
    selectedRowColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Config.blackColor,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        fontFamily: Config.defaultFont,
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
      headline5: TextStyle(
        fontFamily: Config.defaultFont,
        color: Config.whiteColor,
        fontWeight: FontWeight.normal,
        fontSize: 30.0,
      ),
      headline6: Config.blackTextStyle,
      bodyText1: Config.whiteTextStyle,
      bodyText2: Config.whiteTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Config.blackColor),
        backgroundColor: MaterialStateProperty.all<Color>(Config.blackColor),
        elevation: MaterialStateProperty.all<double>(0.0),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Config.whiteColor),
          ),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Config.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Config.blackColor,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      hintStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      labelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      contentPadding: const EdgeInsets.all(10),
      isDense: true,
    ),
  );
  static ThemeData light = ThemeData(
    indicatorColor: Config.blackColor,
    focusColor: Config.whiteColor,
    cardColor: Colors.white,
    dividerColor: Config.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Config.whiteColor,
    ),
    shadowColor: Config.blackColor.withOpacity(0.5),
    brightness: Brightness.light,
    backgroundColor: Config.whiteColor,
    primaryColor: Config.primaryColor,
    selectedRowColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        fontFamily: Config.defaultFont,
        color: Config.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
      headline5: TextStyle(
        fontFamily: Config.defaultFont,
        color: Config.blackColor,
        fontWeight: FontWeight.normal,
        fontSize: 30.0,
      ),
      headline6: Config.whiteTextStyle,
      bodyText1: Config.blackTextStyle,
      bodyText2: Config.blackTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(0.0),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.black26,
      ),
      contentPadding: EdgeInsets.all(10),
      isDense: true,
    ),
  );
}
