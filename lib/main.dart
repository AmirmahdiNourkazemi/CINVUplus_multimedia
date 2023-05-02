import 'package:connectplus/splash_screen.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
          textTheme: Typography(platform: TargetPlatform.iOS).black,
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: colorScheme,
          bottomNavigationBarTheme: bottomNavigationBarTheme),
    );
  }
}
