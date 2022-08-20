import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StarsPage extends StatefulWidget {
  const StarsPage({Key? key}) : super(key: key);

  @override
  State<StarsPage> createState() => _StarsPageState();
}

class _StarsPageState extends State<StarsPage> {
  late WebViewController controller;
  bool isLoading = true;

  void _hideElement() {
    controller.runJavascript(
        "document.getElementsByTagName('footer')[0].style.display = 'none'");
    controller.runJavascript(
        "document.getElementsByTagName('header')[0].style.display = 'none'");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].classList.remove('d-block')");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].style.display = 'none'");
    controller.runJavascript(
        "document.querySelectorAll('.Layout-sidebar')[1].style.display = 'none'");
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
          initialUrl: 'https://github.com/maulanafanny?tab=stars',
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
