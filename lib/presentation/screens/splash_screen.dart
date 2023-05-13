import 'dart:async';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcaseview/showcaseview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) {
            return ShowCaseWidget(builder: Builder(builder: (context) => const HomeScreen(),),);
          }),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FadeTransition(
                          opacity: animation!,
                          child: const Icon(
                            Icons.lightbulb_outline,
                            size: 100.0,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: smallDistance),
                        ),
                        SvgPicture.asset(
                          'assets/images/cinvu-logo.svg',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(
                          height: smallDistance,
                        ),
                        Column(
                          children: [
                            Text(
                              'CINVU Plus',
                              style: TextStyle(
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'www.cinvu.net',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          color: Theme.of(context).canvasColor,
                          strokeWidth: 5.3,
                          backgroundColor: primaryColor,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: largeDistance),
                        ),
                        Text(
                          "Loading...",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 20.0,
                            color: Theme.of(context).canvasColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
