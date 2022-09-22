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
    const List<String> javascriptToExecute = [
      "document.getElementsByTagName('header')[0].hidden = true",
      "document.getElementsByTagName('footer')[0].hidden = true",
      "document.querySelectorAll('.Layout-main > .UnderlineNav')[1].hidden = true",
      "document.querySelectorAll('.user-following-container')[2].hidden = true",
      "document.querySelector('.vcard-names-container.is-stuck .vcard-names').style.opacity = '1'",
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
          initialUrl: 'https://github.com/maulanafanny',
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
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        )
      ]),
    );
  }
}
