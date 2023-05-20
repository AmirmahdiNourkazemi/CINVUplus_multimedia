
import 'package:connectplus/presentation/provider/theme_provider.dart';
import 'package:connectplus/presentation/screens/event_form_screen.dart';
import 'package:connectplus/presentation/screens/home_screen.dart';
import 'package:connectplus/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(themeChangeProvider.darkTheme, context),
            home: const SplashScreen(),
            routes: <String, WidgetBuilder>{
              HOME_SCREEN: (BuildContext context) => const HomeScreen(),
              EVENT_FORM_SCREEN: (BuildContext context) => const HomeScreen(),
              WEB_VIEW_SCREEN: (BuildContext context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
