import 'package:flutter/material.dart';

const smallDistance = 8.0;
const mediumDistance = 16.0;
const largeDistance = 24.0;
const xLargeDistance = 32.0;

const smallRadius = 8.0;
const mediumRadius = 16.0;
const largeRadius = 24.0;
const xLargeRadius = 32.0;

const iconSize = 24.0;

const primaryColor = Color(0xff1A3665);

//light colors
const blackColor = Color(0xff1F1449);
const greyColor = Color(0xff9698A9);
const backgroundColor = Color(0xffededed);

//dark colors
const darkBackgroundColor = Color(0xff070f1e);

const light = FontWeight.w300;
const regular = FontWeight.w400;
const medium = FontWeight.w500;
const semiBold = FontWeight.w600;
const bold = FontWeight.w700;
const extraBold = FontWeight.w800;
const black = FontWeight.w900;

const lightColorScheme = ColorScheme(
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
  onError: Colors.red,
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: Colors.white,
  secondary: primaryColor,
  secondaryContainer: primaryColor,
  surface: primaryColor,
  background: darkBackgroundColor,
  error: Colors.red,
  onPrimary: primaryColor,
  onSecondary: primaryColor,
  onSurface: Colors.white,
  onBackground: darkBackgroundColor,
  onError: Colors.red,
  brightness: Brightness.dark,
);

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    canvasColor: (isDarkTheme) ? Colors.white : Colors.black,
    primaryColor: primaryColor,
    cardColor: (isDarkTheme) ? Colors.black : Colors.white,
    scaffoldBackgroundColor:
        (isDarkTheme) ? darkBackgroundColor : backgroundColor,
    iconTheme:
        IconThemeData(color: (isDarkTheme) ? Colors.white : Colors.black),
    colorScheme: (isDarkTheme) ? darkColorScheme : lightColorScheme,
  );
}
