import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController!.canGoBack()) {
          webViewController!.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                    // initialUrlRequest:
                    // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
                    // initialFile: "assets/index.html",
                    initialUserScripts: UnmodifiableListView<UserScript>([]),
                    // contextMenu: contextMenu,
                    onWebViewCreated: (controller) async {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) async {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },

                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;

                      if (![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about"
                      ].contains(uri.scheme)) {
                        if (await canLaunchUrl(uri)) {
                          // Launch the App
                          await launchUrl(
                            uri,
                          );
                          // and cancel the request
                          return NavigationActionPolicy.CANCEL;
                        }
                      }

                      return NavigationActionPolicy.ALLOW;
                    },
                    onLoadStop: (controller, url) async {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },

                    onProgressChanged: (controller, progress) {
                      setState(() {
                        this.progress = progress / 100;
                        urlController.text = url;
                      });
                    },
                    onUpdateVisitedHistory: (controller, url, isReload) {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                  ),
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
