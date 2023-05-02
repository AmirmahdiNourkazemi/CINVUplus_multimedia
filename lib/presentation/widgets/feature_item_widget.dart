import 'dart:io';

import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class FeatureItemWidget extends StatelessWidget {
  final Feature feature;

  const FeatureItemWidget({super.key, required this.feature});

  Future<void> _launchUrl() async {
    if (feature.isEnable && feature.siteUrl != null) {
      if (await hasNetwork()) {
        Uri url = Uri.parse(feature.siteUrl!);
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      } else {
        Fluttertoast.showToast(
            msg: "Please check your internet.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (feature.isEnable && feature.siteUrl != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return WebViewScreen(url: feature.siteUrl!);
              }),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(smallDistance),
        decoration: BoxDecoration(
          color:
              (feature.isEnable) ? Colors.white : Colors.grey.withOpacity(0.3),
          border: Border.all(
            width: 1,
            color: (feature.isEnable) ? primaryColor : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(largeRadius),
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 32,
              left: 120,
              child: SvgPicture.asset(
                'assets/images/cinvu-logo.svg',
                height: 64,
                width: 64,
              ),
            ),
            Center(
              child: Text(
                feature.label,
                style: TextStyle(
                  fontSize: 30,
                  color: (feature.isEnable)
                      ? Colors.black
                      : Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
