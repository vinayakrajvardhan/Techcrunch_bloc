// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../data/model/data.dart';

class TechcrunchWebview extends StatefulWidget {
  final String url;
  final TechcrunchData techcrunchData;
  const TechcrunchWebview({
    Key? key,
    required this.url,
    required this.techcrunchData,
  }) : super(key: key);

  @override
  _TechcrunchWebviewState createState() => _TechcrunchWebviewState();
}

class _TechcrunchWebviewState extends State<TechcrunchWebview> {
  late String finalUrl;
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  @override
  void initState() {
    if (widget.url.toString().contains("http://")) {
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.techcrunchData.title.rendered,
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
}
