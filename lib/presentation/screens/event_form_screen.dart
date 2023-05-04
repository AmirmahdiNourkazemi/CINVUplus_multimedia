import 'package:connectplus/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../utils/utils.dart';

class EventFormScreen extends StatefulWidget {
  const EventFormScreen({Key? key}) : super(key: key);

  @override
  State<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _codeKey = GlobalKey<FormState>();
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
                padding: EdgeInsets.all(mediumDistance),
                child: Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Event details',
                        style: TextStyle(fontSize: 20, fontWeight: bold),
                      ),
                      SizedBox(
                        height: largeDistance,
                      ),
                      Form(
                          key: _codeKey,
                          child: TextFormField(
                            maxLength: 19,
                            maxLines: 1,
                            controller: codeController,
                            validator: validateCode,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              labelText: 'Code',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                            ),
                          )),
                      SizedBox(
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                            ),
                          )),
                      SizedBox(
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                            ),
                          )),
                      SizedBox(
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                            ),
                          )),
                      SizedBox(
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.circular(smallDistance),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: xLargeDistance,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(370, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(smallRadius),
                          ),
                        ),
                        onPressed: () {
                          if ((_codeKey.currentState!.validate() &
                              _fnameKey.currentState!.validate() &
                              _lnameKey.currentState!.validate() &
                              _mobileKey.currentState!.validate() &
                              _emailKey.currentState!.validate())) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) {
                                  String url =
                                      "https://www.connectteam.ir/comminucationswebservice?Code=${codeController.text}&fname=${fnameController.text}&lname=${lnameController.text}&mobile=${mobileController.text}&email=${emailController.text}";
                                  return WebViewScreen(
                                      url: url, label: "Events");
                                }),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      SizedBox(height: largeDistance),
                    ],
                  ),
                ))),
      ),
    );
  }
}
