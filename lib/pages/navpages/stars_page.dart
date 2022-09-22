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
    const List<String> javascriptToExecute = [
      "document.getElementsByTagName('footer')[0].hidden = true",
      "document.getElementsByTagName('header')[0].hidden = true",
      "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].hidden = true",
      "document.querySelectorAll('.Layout-sidebar')[1].hidden = true",
      "document.documentElement.setAttribute('data-color-mode', 'dark')"
    ];
    for (final js in javascriptToExecute) {
      controller.runJavascript(js);
    }
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
          backgroundColor: const Color.fromARGB(255, 36, 41, 47),
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
            child: CircularProgressIndicator(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
