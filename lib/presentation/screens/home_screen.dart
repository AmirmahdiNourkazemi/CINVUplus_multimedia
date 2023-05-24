import 'dart:io';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../widgets/feature_item_widget.dart';

final _featureItems = [
  Feature(
      label: "ERP",
      siteUrl: "https://fa.conexusportal.com/",
      iconColor: const Color(0xff313f6b),
      icon: Icons.play_lesson_outlined,
      description:
          'ERP is a software system that integrates different business functions like accounting, human resources, inventory management, and customer relationship management into one platform. It helps organizations improve efficiency, reduce costs, and make informed decisions by providing real-time visibility into key business data.'),
  Feature(
    label: "Cloud",
    siteUrl: "https://cloud.cinvu.net/",
    iconColor: const Color(0xff313f6b),
    icon: Icons.cloud_download_outlined,
    description:
        'A cloud is a type of service that allows you to store your files and data remotely on servers operated by a third-party provider. By using a cloud service, you can access your files and data from anywhere in the world as long as you have an internet connection.',
  ),
  Feature(
    label: "Connect",
    siteUrl: "https://cinvuplus.net/",
    iconColor: const Color(0xff3b4c81),
    icon: Icons.contact_page_outlined,
    description:
        'Our platform is a social network application that allows users to connect with universities, share photos, and discover new content. Similar to Instagram, our app offers a visually appealing, user-friendly interface that makes it easy to browse and engage with the latest trends and popular posts. ',
  ),
  Feature(
    label: "Automation",
    siteUrl: "https://office.cinvu.net/",
    iconColor: const Color(0xff3b4c81),
    icon: Icons.supervised_user_circle_outlined,
    description:
        'Our automation system streamlines the process of official correspondence by automating tasks such as document creation, formatting, and distribution. By eliminating the need for manual input, our system increases efficiency and accuracy while reducing time and costs associated with manual labor. ',
  ),
  Feature(
      label: "Tube",
      siteUrl: "https://connecttube.ir/",
      iconColor: const Color(0xff455996),
      icon: Icons.video_camera_front_rounded,
      description:
          'Our video sharing platform is designed to provide users with a seamless and intuitive experience for uploading, sharing, and discovering videos. Similar to YouTube, Our platform also includes features such as video recommendations, comments, and social media integration to enhance the user'
          's experience and foster engagement within the community.'),
  Feature(
    label: "Events",
    siteUrl: "https://events.cinvu.net",
    iconColor: const Color(0xff455996),
    icon: Icons.event_available_outlined,
    description:
        'Our events platform is the ultimate tool for planning, promoting, and managing events of all sizes and types. From conferences ,festivals, and social gatherings, our platform provides a comprehensive suite of features that help event organizers plan and execute successful events.',
  ),
  Feature(
    label: "Room",
    isEnable: false,
    iconColor: const Color(0xff4e65AB),
    icon: Icons.add_home_work_outlined,
  ),
  Feature(
    label: "Mail",
    siteUrl: "https://mail.cinvu.net:2096",
    //isEnable: false,
    iconColor: const Color(0xff4e65AB),
    icon: Icons.mail_outline,
  ),
  Feature(
    label: "Call",
    isEnable: false,
    iconColor: const Color(0xff6276b7),
    icon: Icons.call_outlined,
  ),
  Feature(
    label: "LMS",
    siteUrl: "https://lms.cinvu.net",
    iconColor: const Color(0xff6276b7),
    icon: Icons.laptop_mac_sharp,
  ),
  Feature(
    label: "Market",
    isEnable: false,
    iconColor: const Color(0xff7788c1),
    icon: Icons.shop,
  ),
  Feature(
    label: "Inquiry",
    siteUrl: "https://inquiry.cinvu.net",
    //isEnable: false,
    iconColor: const Color(0xff7788c1),
    icon: Icons.get_app_outlined,
  ),
  Feature(
    label: "Accredition",
    isEnable: false,
    iconColor: const Color(0xff8c9bca),
    icon: Icons.document_scanner_rounded,
  ),
  Feature(
    label: "Meta",
    isEnable: false,
    iconColor: const Color(0xff8c9bca),
    icon: Icons.airplay_sharp,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool cirAn = false;

  late DarkThemeProvider themeProvider;

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutSine,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<DarkThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return cirAn
        ? CircularRevealAnimation(
            centerOffset: Offset(size.width / 1.5, 64),
            animation: animation,
            child: _buildHomeBody(
              themeProvider,
            ),
          )
        : _buildHomeBody(themeProvider);
  }

  Widget _buildHomeBody(DarkThemeProvider themeProvider) {
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
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(mediumRadius)),
        ),
        drawer: SafeArea(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: smallDistance),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 115.0,
                          margin: const EdgeInsets.only(
                            top: 24.0,
                            bottom: 64.0,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/cinvu-logo.svg',
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _onThemeChange,
                        icon: Icon((themeProvider.darkTheme)
                            ? Icons.nightlight
                            : Icons.sunny),
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: smallDistance),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(smallDistance),
                      color: primaryColor.withOpacity(0.7),
                    ),
                    child: ListTile(
                      subtitle: const Text(
                        'The COMSTECH Inter-Islamic Network on Virtual Universities is an autonomous, non-political organization with an international approach and under the auspices of the Standing Committee on Scientific and Technological Cooperation of OIC member countries.',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white60,
                        ),
                      ),
                      onTap: () {},
                      leading: const Icon(
                        Icons.roundabout_right_rounded,
                        color: Colors.white,
                      ),
                      title: const Text('About us'),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    subtitle: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.mail_outline,
                              size: 15,
                              color: Colors.white54,
                            ),
                            Text(
                              ' Email: info@cinvu.net',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.phone, size: 15, color: Colors.white54),
                            Text(
                              ' Phone: +982191011078',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    leading: const Icon(Icons.contact_support_outlined),
                    title: const Text('Contact us'),
                  ),
                  ListTile(
                    onTap: () {},
                    subtitle: Column(
                      children: [
                        
                      const Text ('Calendar')
                      ],
                    ),
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
          //backgroundColor: Color(0xff2E3F6D),
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.paid,
                  size: 32,
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: smallDistance),
              child: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: const Icon(
                  Icons.menu_outlined,
                  size: 32,
                ),
              ),
            ),
            title: const Text('CINVU Plus'),
          ),
          body: AnimationLimiter(
            child: GridView.count(
              childAspectRatio: 1.4,
              padding: const EdgeInsets.all(11),
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
        ),
      ),
    );
  }

  void _onThemeChange() {
    themeProvider.darkTheme = !themeProvider.darkTheme;

    setState(() {
      cirAn = true;
    });

    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      animationController.reset();
      animationController.forward();
    } else {
      animationController.forward();
    }
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
