import 'dart:io';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:connectplus/feature/meta_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/feature_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  final _featureItems = [
    Feature("ERP", "https://cinvuplus.net/"),
    Feature("Contact", "https://cinvuplus.net/"),
    Feature("Market", "https://cinvuplus.net/"),
    Feature("Calling", "https://cinvuplus.net/"),
    Feature("Tube", "https://cinvuplus.net/"),
    Feature("Event", "https://cinvuplus.net/"),
    Feature("Mail", "https://cinvuplus.net/"),
    Feature("Cloud", "https://cinvuplus.net/"),
    Feature("Exhibition", "https://cinvuplus.net/"),
    Feature("Oas", "https://cinvuplus.net/"),
    Feature("Inquiry", "https://cinvuplus.net/"),
    Feature("Meta", "https://cinvuplus.net/"),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_advancedDrawerController.value.visible) {
            _advancedDrawerController.hideDrawer();
            return false;
          }
          return true;
        },
        child: AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  primaryColor.withOpacity(0.7),
                ],
              ),
            ),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(mediumRadius)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: smallDistance),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 128.0,
                        height: 128.0,
                        margin: const EdgeInsets.only(
                          top: 24.0,
                          bottom: 64.0,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/cinvu-logo.svg',
                        ),
                      ),
                      SizedBox(height: smallDistance),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(smallDistance),
                          color: primaryColor.withOpacity(0.2),
                        ),
                        child: ListTile(
                          onTap: () {},
                          leading: Icon(Icons.roundabout_right_rounded,
                              color: primaryColor),
                          title: Text('About us',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.contact_support_outlined),
                        title: const Text('Contact us'),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: ListTile(
                          onTap: () {
                            exit(0);
                          },
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text('Exit'),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          child: Scaffold(
            appBar: AppBar(
                leading: Padding(
                    padding: EdgeInsets.only(left: smallDistance),
                    child: IconButton(
                        onPressed: _handleMenuButtonPressed,
                        icon: const Icon(Icons.menu))),
                title: const Text('CINVUPlus')),
            body: AnimationLimiter(
              child: GridView.count(
                  padding: EdgeInsets.all(smallDistance),
                  crossAxisCount: 2,
                  children: List.generate(
                    _featureItems.length,
                    (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 350),
                        columnCount: 2,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: FeatureItemWidget(
                                    feature: _featureItems[index]))),
                      );
                    },
                  )),
            ),
<<<<<<< HEAD
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
=======
          ],
        ),
      ),
      appBar: AppBar(
          leading: Padding(
              padding: EdgeInsets.only(left: smallDistance),
              child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu))),
          title: const Text('CINVUPlus')),
      body: AnimationLimiter(
        child: GridView.count(
          padding: EdgeInsets.all(smallDistance),
          crossAxisCount: 2,
          children: List.generate(
            _featureItems.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 350),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: FeatureItemWidget(
                      feature: _featureItems[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
>>>>>>> 7c129fcd0f87d43e30082025240e06620b97142b
  }
}
