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
    return GestureDetector(
        onTap: _launchUrl,
        child: Container(
          margin: EdgeInsets.all(smallDistance),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
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
                  height: 72,
                  width: 72,
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
        ));
  }
}
