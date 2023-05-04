import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:connectplus/presentation/screens/event_form_screen.dart';
import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureItemWidget extends StatelessWidget {
  final Feature feature;

  const FeatureItemWidget({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (feature.isEnable && feature.siteUrl != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                if (feature.label == "Events") {
                  return const EventFormScreen();
                } else {
                  return WebViewScreen(
                      url: feature.siteUrl!, label: feature.label);
                }
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Opacity(
                    opacity: (feature.isEnable) ? 1 : 0.5,
                    child: SvgPicture.asset(
                      color: feature.iconColor,
                      'assets/images/cinvu-logo.svg',
                      height: 54,
                      width: 54,
                    ),
                  )),
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
                )
                    .animate()
                    .move(delay: 300.ms, duration: 600.ms)
                    .move(duration: 400.ms)
                    .scale(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
