import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class FeatureItemWidget extends StatelessWidget {
  final Feature feature;

  const FeatureItemWidget({super.key, required this.feature});

  Future<void> _launchUrl() async {
    Uri url = Uri.parse(feature.siteUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (feature.label == 'Meta') {
      return GestureDetector(
        onTap: () {
          var snackBar = const SnackBar(
              backgroundColor: Color(0xff313F6B),
              content: Text(
                'Coming soon....',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Color(0xff313F6B),
            ),
            borderRadius: BorderRadius.circular(30),
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 110,
                child: SvgPicture.asset(
                  'assets/images/cinvu-logo.svg',
                  height: 70,
                  width: 70,
                ),
              ),
              const Center(
                child: Text(
                  'Meta',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        margin: EdgeInsets.all(smallDistance),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Color(0xff313F6B),
          ),
          borderRadius: BorderRadius.circular(largeRadius),
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 120,
              child: SvgPicture.asset(
                'assets/images/cinvu-logo.svg',
                height: 65,
                width: 65,
              ),
            ),
            Center(
              child: Text(
                feature.label,
                style: const TextStyle(
                  fontSize: 30,
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