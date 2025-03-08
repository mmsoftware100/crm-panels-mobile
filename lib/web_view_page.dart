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
  int progress = 0;

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google WebView'),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          print("onWillPop");
          print(webViewController?.canGoBack());
          bool stauts = await webViewController?.canGoBack() ?? false;
          print(stauts);
          if(stauts){
            webViewController?.goBack();
            return false;
          }
          else{
            return true;
          }
        },
        child: Column(
          children: [
            Text(progress.toString()),
            LinearProgressIndicator(
              value: progress / 100,
              color: Colors.red,
            ),
            Expanded(
              child: InAppWebView(
                key: webViewKey,
                // initialUrlRequest: URLRequest(url: WebUri('https://www.google.com')),
                initialUrlRequest: URLRequest(url: WebUri('https://crm.software100.com.mm/panels')),
                onWebViewCreated: (controller) {
                  webViewController = controller;
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
                onProgressChanged: (controller, webProgress) {
                  print("onProgressChanged");
                  print(progress);
                  setState(() {
                    progress = webProgress;
                  });
                },
              ),
            ),
          ],
        ),

      ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (await webViewController?.canGoBack() ?? true) {
                    webViewController?.goBack();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () async {
                  if (await webViewController?.canGoForward() ?? false) {
                    webViewController?.goForward();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  webViewController?.reload();
                },
              ),
            ],
          ),
        )

    );
  }
  
}