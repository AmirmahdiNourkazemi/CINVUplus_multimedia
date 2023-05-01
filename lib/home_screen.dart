import 'dart:io';
import 'dart:ui';

import 'package:connectplus/feature/Exhibition_contaner.dart';
import 'package:connectplus/feature/calling_container.dart';
import 'package:connectplus/feature/cloud_container.dart';
import 'package:connectplus/feature/event_container.dart';
import 'package:connectplus/feature/meta_container.dart';
import 'package:connectplus/feature/tube_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'feature/connect_container.dart';
import 'feature/erp_container.dart';
import 'feature/mail_container.dart';
import 'feature/markert_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> widgets = [
    ErpContainer(),
    ConnectContainer(),
    MarketContainer(),
    CallingContainer(),
    TubeContainer(),
    EventContainer(),
    MailContainer(),
    CloudContainer(),
    ExhibitionContainer(),
    MetaContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

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
              decoration: const BoxDecoration(
                color: Color(0xff313F6B),
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
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'about us',
                    softWrap: true,
                    textScaleFactor: 1.3,
                  ),
                ],
              ),
              onTap: () {
                print('object');
              },
            ),
            Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.white,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'contact us',
                    softWrap: true,
                    textScaleFactor: 1.3,
                  ),
                ],
              ),
              onTap: () {
                print('object');
              },
            ),
            Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.white,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Exit',
                    softWrap: true,
                    textScaleFactor: 1.3,
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
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xedededed).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverAppBar(
                  shadowColor: Colors.white,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 32,
                    ),
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                  backgroundColor: const Color(0xff313F6B),
                  title: const Text(
                    'CINVUplus',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15, // Number of columns
                    children: List.generate(
                      widgets.length,
                      (index) {
                        return widgets[index];
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
