import 'dart:io';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
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

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final _advancedDrawerController = AdvancedDrawerController();

  final _featureItems = [
    Feature(
        label: "Connect",
        siteUrl: "https://cinvuplus.net/",
        iconColor: const Color.fromARGB(255, 3, 151, 165),
        icon: Icons.contact_page),
    Feature(
        label: "OAS",
        siteUrl: "https://office.cinvu.net/",
        iconColor: const Color.fromARGB(255, 4, 46, 153),
        icon: Icons.supervised_user_circle),
    Feature(
      label: "Cloud",
      siteUrl: "https://cloud.cinvu.net/",
      iconColor: const Color(0xff39a3fa),
      icon: Icons.cloud_download_outlined,
    ),
    Feature(
      label: "Tube",
      siteUrl: "https://connecttube.ir/",
      iconColor: const Color.fromARGB(255, 185, 60, 2),
      icon: Icons.video_camera_front_rounded,
    ),
    Feature(
      label: "ERP",
      siteUrl: "https://fa.conexusportal.com/",
      iconColor: const Color.fromARGB(255, 65, 5, 144),
      icon: Icons.play_lesson_outlined,
    ),
    Feature(
      label: "Events",
      siteUrl: "https://connectteam.ir/Cinvuevent1",
      iconColor: const Color.fromARGB(255, 3, 150, 37),
      icon: Icons.event_available,
    ),
    Feature(
      label: "Mail",
      isEnable: false,
      icon: Icons.mail,
    ),
    Feature(
      label: "Calling",
      isEnable: false,
      icon: Icons.call,
    ),
    Feature(
      label: "T&Lms",
      isEnable: false,
      icon: Icons.laptop_mac_sharp,
    ),
    Feature(
      label: "Market",
      isEnable: false,
      icon: Icons.shop,
    ),
    Feature(
      label: "Exhibition",
      isEnable: false,
      icon: Icons.add_home_work,
    ),
    Feature(
      label: "Inquiry",
      isEnable: false,
      icon: Icons.get_app_outlined,
    ),
    Feature(
      label: "VoIP",
      isEnable: false,
      icon: Icons.speaker_group,
    ),
    Feature(
      label: "Metaverse",
      isEnable: false,
      icon: Icons.airplay_sharp,
    ),
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
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(left: smallDistance),
                child: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: const Icon(Icons.menu),
                ),
              ),
              title: const Text('CINVU Plus'),
            ),
            body: AnimationLimiter(
              child: GridView.count(
                  childAspectRatio: 1.4,
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
                  )),
            ),
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
