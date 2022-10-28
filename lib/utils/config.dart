import 'package:flutter/material.dart';

enum Environment { production, development }

enum TokenLabel { none, xa, tokenId }

enum FetchDataMethod { get, post, put, delete }

class Config {
  Config();

  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  //FONT WEIGHT
  static FontWeight light = FontWeight.w100;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;

  //COLOR
  static Color blackColor = Colors.black;
  static Color whiteColor = fromHex('#f8f8f8');
  static Color primaryColor = fromHex('#96694C');

  //DARK MODE
  static Color darkBackground = fromHex('#212121');
  static Color darkPrimaryColor = fromHex('#D8811F');
  static Color darkSecondaryBackground = fromHex('#2D2D2D');

  //FONT
  static String defaultFont = 'Poppins';

  static TextStyle primaryTextStyle = TextStyle(
    color: primaryColor,
    fontFamily: defaultFont,
    decoration: TextDecoration.none,
  );

  static TextStyle blackTextStyle = TextStyle(
    color: blackColor,
    fontFamily: defaultFont,
    decoration: TextDecoration.none,
  );

  static TextStyle whiteTextStyle = TextStyle(
    color: whiteColor,
    fontFamily: defaultFont,
    decoration: TextDecoration.none,
  );
  static Environment env = Environment.production;

  static String domain = env == Environment.production ? '' : '';
}
