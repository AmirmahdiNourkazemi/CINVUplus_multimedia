import 'package:flutter/material.dart';

double smallDistance = 8.0;
double mediumDistance = 16.0;
double largeDistance = 24.0;
double xLargeDistance = 32.0;

double smallRadius = 8.0;
double mediumRadius = 16.0;
double largeRadius = 24.0;
double xLargeRadius = 32.0;

double iconSize = 24.0;

Color primaryColor = const Color(0xff1A3665);
Color blackColor = const Color(0xff1F1449);
Color greyColor = const Color(0xff9698A9);
Color backgroundColor = const Color(0xfff9f9f9);

BottomNavigationBarThemeData bottomNavigationBarTheme =
BottomNavigationBarThemeData(
  selectedItemColor: primaryColor,
  unselectedItemColor: greyColor,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  backgroundColor: primaryColor,
  type: BottomNavigationBarType.fixed,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ColorScheme colorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: blackColor,
  secondary: primaryColor,
  secondaryContainer: primaryColor,
  surface: blackColor,
  background: backgroundColor,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: backgroundColor,
  onError: Colors.white,
  brightness: Brightness.light,
);