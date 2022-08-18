import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => WebviewScaffold(
          url: "https://www.facebook.com",
          appBar: AppBar(
            title: const Text("Widget webview"),
          ),
        ),
      },
    );
  }
}
