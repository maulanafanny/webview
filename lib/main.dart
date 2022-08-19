import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  int _selectedIndex = 0;

  void _hideProfile() {
    controller.runJavascript("document.querySelectorAll('.Layout-sidebar')[1].style.display = 'none'");
  }

  void _hideElement() {
    controller.runJavascript("document.getElementsByTagName('footer')[0].style.display = 'none'");
    controller.runJavascript("document.querySelectorAll('.Layout-main > .UnderlineNav')[1].classList.remove('d-block')");
    controller.runJavascript("document.querySelectorAll('.Layout-main > .UnderlineNav')[1].style.display = 'none'");
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          _selectedIndex = index;
          log(_selectedIndex.toString());
          controller.loadUrl('https://github.com/maulanafanny');
        });
        break;
      case 1:
        setState(() {
          _selectedIndex = index;
          log(_selectedIndex.toString());
          controller
              .loadUrl('https://github.com/maulanafanny?tab=repositories');
        });
        break;
      case 2:
        setState(() {
          _selectedIndex = index;
          log(_selectedIndex.toString());
          controller.loadUrl('https://github.com/maulanafanny?tab=stars');
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App Webview',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maulanafanny GitHub Profile'),
          backgroundColor: Colors.red,
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await controller.canGoBack()) {
              controller.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: WebView(
            initialUrl: 'https://github.com/maulanafanny',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageFinished: (url) {
              _hideElement();
              if (url != 'https://github.com/maulanafanny') {
                _hideProfile();
              }
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Repository',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 70, 0, 0),
          ),
        ),
      ),
    );
  }
}
