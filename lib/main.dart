import 'dart:io';

import 'package:webview/pages/navpages/main_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

import 'SideBar.dart';

void main() {
  runApp(const WebViewExample());
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  late WebViewController controller;
  bool isLoading = true;

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maulanafanny\'s GitHub Profile'),
          backgroundColor: const Color.fromARGB(255, 36, 41, 47),
        ),
        body: const MainPage(),
        drawer: const SideBar(),
      ),
    );
  }
}
