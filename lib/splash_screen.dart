import 'dart:async';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) {
            return const HomeScreen();
          }),
        ),
      );
    });
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
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF9F9F9),
                ),
              ),
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
                            color: Colors.white,
                            size: 100.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: smallDistance),
                        ),
                        SvgPicture.asset(
                          'assets/images/cinvu-logo.svg',
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(
                          height: smallDistance,
                        ),
                        const Text(
                          'Cinvu plus',
                          style: TextStyle(
                            color: Color(0xff313F6B),
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 5.3,
                          backgroundColor: Color(0xff313F6B),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: largeDistance),
                        ),
                        const Text(
                          "Loading...",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color(0xff313F6B),
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