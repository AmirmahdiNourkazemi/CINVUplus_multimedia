import 'dart:io';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/feature_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    Feature("Meta", "https://cinvuplus.net/")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/cinvu-logo.svg',
                    height: 100,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(
                    'CINVUplus',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.roundabout_right_rounded),
                  SizedBox(
                    width: smallDistance,
                  ),
                  const Text(
                    'About us',
                    softWrap: true,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            Divider(
              indent: largeDistance,
              endIndent: largeDistance,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.white,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.contact_page),
                  SizedBox(
                    width: smallDistance,
                  ),
                  const Text(
                    'Contact us',
                    softWrap: true,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                _scaffoldKey.currentState!.closeDrawer();
              },
            ),
            Divider(
              indent: largeDistance,
              endIndent: largeDistance,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.white,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.exit_to_app),
                  SizedBox(
                    width: smallDistance,
                  ),
                  const Text(
                    'Exit',
                    softWrap: true,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                exit(0);
              },
            ),
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
                              feature: _featureItems[index]))),
                );
              },
            )),
      ),
    );
  }
}
