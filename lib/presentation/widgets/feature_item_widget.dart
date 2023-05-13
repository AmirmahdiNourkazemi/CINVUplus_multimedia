import 'package:connectplus/config/theme.dart';
import 'package:connectplus/domain/entities/feature.dart';
import 'package:connectplus/presentation/screens/event_form_screen.dart';
import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class FeatureItemWidget extends StatelessWidget {
  final Feature feature;

  FeatureItemWidget({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: FadeInAnimation(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                highlightColor:
                    (feature.isEnable) ? feature.iconColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                radius: 20,
                onLongPress: () {
                  if (feature.isEnable) {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          height: 330,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'What is ${feature.label}?',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: smallDistance),
                                  child: Text(
                                    '${feature.description}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ThemeData().bottomAppBarColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ThemeData().primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (!feature.isEnable) {
                    QuickAlert.show(
                      confirmBtnColor: ThemeData().primaryColor,
                      backgroundColor: ThemeData().hoverColor,

                      titleColor: ThemeData().primaryColor,
                      textColor: ThemeData().primaryColor,

                      //titleColor: feature.iconColor!,
                      //backgroundColor: feature.iconColor!,
                      //barrierDismissible: true,
                      context: context,

                      type: QuickAlertType.info,
                      title: 'Warning',
                      text: '${feature.label} is available soon ...',
                    );
                  }
                },
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
                  if (!feature.isEnable) {
                    final snackBar = SnackBar(
                      backgroundColor: primaryColor,
                      content: Text(
                        '${feature.label} is available soon...',
                        style: const TextStyle(color: Colors.white),
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(smallDistance),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 2,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        feature.iconColor!.withOpacity(1),
                        feature.iconColor!.withOpacity(1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // gradient: (feature.isEnable)
                    //     ? LinearGradient(
                    //         colors: [
                    //           feature.iconColor!.withOpacity(1),
                    //           feature.iconColor!.withOpacity(1)
                    //         ],
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //       )
                    //     : LinearGradient(colors: [
                    //         Colors.grey.withOpacity(0.3),
                    //         Colors.grey.withOpacity(0.3)
                    //       ]),
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(largeRadius),
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: smallDistance),
                          child: Opacity(
                            opacity: 1,
                            child: SvgPicture.asset(
                              'assets/images/cinvu-logo.svg',
                              height: 47,
                              width: 47,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: smallDistance),
                            child: Row(
                              children: [
                                Opacity(
                                  opacity: 1,
                                  child: Icon(
                                    feature.icon,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  feature.label,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
