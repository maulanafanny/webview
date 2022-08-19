import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
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

  int _selectedIndex = 0;

  void _hideProfile() {
    controller.runJavascript(
        "document.querySelectorAll('.Layout-sidebar')[1].style.display = 'none'");
  }

  void _hideElement() {
    controller.runJavascript(
        "document.getElementsByTagName('footer')[0].style.display = 'none'");
    controller.runJavascript(
        "document.getElementsByTagName('header')[0].style.display = 'none'");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].classList.remove('d-block')");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].style.display = 'none'");
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
          backgroundColor: const Color.fromARGB(255, 36, 41, 47),
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
          child: Stack(children: [
            WebView(
              initialUrl: 'https://github.com/maulanafanny',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onProgress: (progress) {},
              onPageFinished: (url) {
                _hideElement();
                if (url != 'https://github.com/maulanafanny') {
                  _hideProfile();
                }
                setState(() {
                  isLoading = false;
                });
              },
            ),
            Visibility(
              visible: isLoading,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ]),
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
        drawer: const SideBar(),
      ),
    );
  }
}
