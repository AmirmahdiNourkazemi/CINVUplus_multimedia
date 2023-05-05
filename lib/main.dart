import 'package:connectplus/presentation/screens/event_form_screen.dart';
import 'package:connectplus/presentation/screens/home_screen.dart';
import 'package:connectplus/presentation/screens/splash_screen.dart';
import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:connectplus/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'config/theme.dart';

void main() async {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      builder: FToastBuilder(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/home-screen':
            return CupertinoPageRoute(builder: (_) => const HomeScreen());
          case 'web-view-screen':
            final url = settings.arguments as String;
            final label = settings.arguments as String;
            return MaterialPageRoute(
              builder: (_) => WebViewScreen(url: url, label: label),
              settings: settings,
            );
          case 'event-form-screen':
            return MaterialPageRoute(
              builder: (_) => const EventFormScreen(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              },
            );
        }
      },
      theme: ThemeData(
          primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
          textTheme: Typography(platform: TargetPlatform.iOS).black,
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: colorScheme,
          bottomNavigationBarTheme: bottomNavigationBarTheme),
    );
  }
}



