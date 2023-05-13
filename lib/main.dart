import 'package:connectplus/constant/constant.dart';
import 'package:connectplus/data/shared_preference.dart';
import 'package:connectplus/presentation/provider/theme_provider.dart';
import 'package:connectplus/presentation/screens/home_screen.dart';
import 'package:connectplus/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import 'config/theme.dart';

Future<void> main() async {
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
    await themeChangeProvider.sharedPrefs.init();
    themeChangeProvider.darkTheme =
        (themeChangeProvider.sharedPrefs.isDarkTheme());
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
            home: Scaffold(
              body: ShowCaseWidget(
                onStart: (index, key) {
                  debugPrint('onStart: $index, $key');
                },
                onComplete: (index, key) {
                  debugPrint("hiiiiiiiiiiiiiiiiiiiiiiiii");
                  if (index == 4) {
                    SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light.copyWith(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white,
                      ),
                    );
                  }
                },
                blurValue: 1,
                builder: Builder(builder: (context) => const SplashScreen()),
                autoPlayDelay: const Duration(seconds: 3),
              ),
            ),
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
