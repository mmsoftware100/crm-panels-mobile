import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google WebView'),
      ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: WebUri('https://www.google.com')),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          var uri = navigationAction.request.url!;

          if (!["http", "https", "file", "chrome", "data", "javascript", "about"]
              .contains(uri.scheme)) {
            // Handle external URLs here (e.g., open in the device's browser)
            // You might want to use url_launcher for this:
            // if (await canLaunchUrl(uri)) {
            //   await launchUrl(uri);
            //   return NavigationActionPolicy.CANCEL;
            // }

            return NavigationActionPolicy.ALLOW; //or CANCEL depending on your need.
          }
          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (controller, url) async {

        },
        onProgressChanged: (controller, progress) {

        },
      ),
    );
  }
  
}