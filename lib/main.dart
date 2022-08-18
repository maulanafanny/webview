import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(WebViewExample());
}

// ignore: use_key_in_widget_constructors
class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App Webview',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Webview'),
          backgroundColor: Colors.red,
        ),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://github.com/maulanafanny',
        ),
      ),
    );
  }
}
