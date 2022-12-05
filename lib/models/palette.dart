import 'package:flutter/material.dart';
import 'dart:math';

class Palette {
  /// Used for font. Can be used as background color.
  /// ![](https://raw.githubusercontent.com/UTM-AD-Group-Bolt/Pak-Atong-Kafe-App/main/images/iconapp.jpg)
  static const white = MaterialColor(0xfffaf5d8,
    {
      50:  Color(0xffffffff),
      100: Color(0xffffffff),
      200: Color(0xffffffff),
      300: Color(0xffffffff),
      400: Color(0xfffdfaed),
      500: Color(0xfffaf5d8), //Default
      600: Color(0xfff8f1c9),
      700: Color(0xfff6ecb7),
      800: Color(0xfff4e7a4),
      900: Color(0xfff2e292),
    },
  );

  /// Used for tone or shading.
  static const beige = MaterialColor(0xffd8ae8b,
    {
      50:  Color(0xfff5e9e0),
      100: Color(0xfff0ded1),
      200: Color(0xffebd4c2),
      300: Color(0xffe6cab3),
      400: Color(0xffe0bfa3),
      500: Color(0xffd8ae8b), //Default
      600: Color(0xffd6a985),
      700: Color(0xffd19f75),
      800: Color(0xffcc9466),
      900: Color(0xffc78957),
    },
  );

  /// Used for tone or shading.
  static const brown = MaterialColor(0xff624840,
    {
      50:  Color(0xff9e776b),
      100: Color(0xff946d61),
      200: Color(0xff886459),
      300: Color(0xff7b5b51),
      400: Color(0xff6f5249),
      500: Color(0xff624840), //Default
      600: Color(0xff563f38),
      700: Color(0xff4a3630),
      800: Color(0xff3e2d28),
      900: Color(0xff312420),
    },
  );

  /// Used rarely! For added flair.
  static const orange = MaterialColor(0xffcd5f2a,
    {
      50:  Color(0xffe39b78),
      100: Color(0xffe08f67),
      200: Color(0xffdc8356),
      300: Color(0xffd97645),
      400: Color(0xffd56a34),
      500: Color(0xffcd5f2a), //Default
      600: Color(0xffba5826),
      700: Color(0xffa95023),
      800: Color(0xff98481f),
      900: Color(0xff87401c),
    },
  );

  /// Used for buttons color.
  static const yellow = MaterialColor(0xfff2ab37,
    {
      50:  Color(0xfff8d6a0),
      100: Color(0xfff7ce8d),
      200: Color(0xfff6c679),
      300: Color(0xfff5be66),
      400: Color(0xfff4b652),
      500: Color(0xfff2ab37), //Default
      600: Color(0xfff2a62c),
      700: Color(0xfff09e19),
      800: Color(0xffe6940f),
      900: Color(0xffd3870d),
    },
  );

  /// Used for background. Can be used as font color.
  static const black = MaterialColor(0xff26201d,
    {
      50:  Color(0xff685950),
      100: Color(0xff5c4f47),
      200: Color(0xff51453e),
      300: Color(0xff453b35),
      400: Color(0xff3a312c),
      500: Color(0xff26201d), //Default
      600: Color(0xff231d1b),
      700: Color(0xff171312),
      800: Color(0xff0b0909),
      900: Color(0xff0b0909),
    },
  );

  /// Change the alpha value of any color class.
  /// * 'colVal' is the color in Color(0xff000000) format
  /// * 'alpha' is the percentage of opacity in double format
  static Color alpha(Color colVal, [double alpha = 100]) {
    // Parse the hexa RGB values
    String colStr = '#${colVal.toString().substring(10,16)}';

    // Limit alpha to range 0-100
    alpha = min(alpha, 100);
    alpha = max(alpha, 0);

    // Convert alpha from percentage to hexa value
    alpha = (alpha*2.55).ceil().toDouble();

    // Merge the alpha + color values and return as a new color class
    //print (Color(int.parse(colStr.replaceFirst('#', '0x${alpha.toInt().toRadixString(16)}'))));
    return Color(int.parse(colStr.replaceFirst('#', '0x${alpha.toInt().toRadixString(16)}')));
  }
}