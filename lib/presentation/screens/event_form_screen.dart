import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme.dart';
import '../../utils/utils.dart';

class EventFormScreen extends StatefulWidget {
  const EventFormScreen({Key? key}) : super(key: key);

  @override
  State<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _fnameKey = GlobalKey<FormState>();
  final _lnameKey = GlobalKey<FormState>();
  final _mobileKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Event form",
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(mediumDistance),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Event details',
                  style: TextStyle(fontSize: 20, fontWeight: bold),
                ),
                const SizedBox(
                  height: largeDistance,
                ),
                const SizedBox(
                  height: mediumDistance,
                ),
                Form(
                    key: _fnameKey,
                    child: TextFormField(
                      maxLength: 20,
                      controller: fnameController,
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      validator: validateFirstName,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: 'First name',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: mediumDistance,
                ),
                Form(
                    key: _lnameKey,
                    child: TextFormField(
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      controller: lnameController,
                      validator: validateLastName,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Last name',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: mediumDistance,
                ),
                Form(
                    key: _mobileKey,
                    child: TextFormField(
                      maxLength: 11,
                      maxLines: 1,
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      validator: validateMobile,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Mobile',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: mediumDistance,
                ),
                Form(
                    key: _emailKey,
                    child: TextFormField(
                      maxLength: 100,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      controller: emailController,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(smallDistance),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: xLargeDistance,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(smallRadius),
                      ),
                    ),
                    onPressed: () async {
                      //return await _launchURL();
                      // if ((_fnameKey.currentState!.validate() &
                      //     _lnameKey.currentState!.validate() &
                      //     _mobileKey.currentState!.validate() &
                      //     _emailKey.currentState!.validate())) {
                      //   return await _launchURL();
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: ((context) {
                      //         String url =
                      //             "https://www.connectteam.ir/Comminucation_Webservice.aspx?Code=2023050515040212617&fname=${fnameController.text}&lname=${lnameController.text}&mobile=0912&email=${emailController.text}";
                      //         // "https://connectteam.ir/ComminucationGuest?Code=2023050413562293835";
                      //         //"https://www.connectteam.ir/comminucationswebservice?Code=2023050413562293835&fname=${fnameController.text}&lname=${lnameController.text}&mobile=${mobileController.text}&email=${emailController.text}";
                      //         return WebViewScreen(url: url, label: "Events");
                      //       }),
                      //     ),
                      //   );
                      // }

                      if ((await Permission
                                      .microphone.status.isPermanentlyDenied ==
                                  true ||
                              await Permission.microphone.status.isGranted ==
                                  false) |
                          (await Permission.camera.status.isPermanentlyDenied ==
                                  true ||
                              await Permission.camera.status.isGranted ==
                                  false)) {
                        Fluttertoast.showToast(
                            msg: "Please grant permissions to continue.",
                            toastLength: Toast.LENGTH_SHORT);
                        FocusScope.of(context).unfocus();
                        openAppSettings();
                        return;
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            String url =
                                "https://www.connectteam.ir/Comminucation_Webservice.aspx?Code=2023050515040212617&fname=${fnameController.text}&lname=${lnameController.text}&mobile=0912&email=${emailController.text}";
                            url =
                                "https://www.connectteam.ir/Comminucation_Webservice.aspx?Code=2023050518585157972&fname=amirmahdi&lname=nourkazemi&mobile=0912&email=nourkazemi80@gmail.com";
                            return WebViewScreen(url: url, label: "Events");
                          }),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: largeDistance),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    var url =
        "https://www.connectteam.ir/Comminucation_Webservice.aspx?Code=2023050515040212617&fname=${fnameController.text}&lname=${lnameController.text}&mobile=0912&email=${emailController.text}";
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
