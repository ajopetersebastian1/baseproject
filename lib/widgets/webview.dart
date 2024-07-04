import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_scaffold.dart';

class CustomWebView extends StatefulWidget {
  final String url;
  const CustomWebView({super.key, required this.url});

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  @override
  Widget build(BuildContext context) {
    print(widget.url);

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    return AppScaffold(
      padding: EdgeInsets.all(0),
      title: '',
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
