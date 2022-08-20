import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;
  bool isLoading = true;

  void _hideElement() {
    controller.runJavascript(
        "document.getElementsByTagName('header')[0].style.display = 'none'");
    controller.runJavascript(
        "document.getElementsByTagName('footer')[0].style.display = 'none'");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].classList.remove('d-block')");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].style.display = 'none'");
    controller.runJavascript(
        "document.querySelectorAll('.user-following-container')[2].style.display = 'none'");
    controller.runJavascript(
        "document.querySelector('.vcard-names-container.is-stuck .vcard-names').style.opacity = '1'");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          onPageFinished: (url) async {
            _hideElement();
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
    );
  }
}
