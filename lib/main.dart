import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_example_webview_geolocator/widget/webview_geolocator.dart';

void main() => runApp(MaterialApp(home: WebViewGeolocatorExample()));

class WebViewGeolocatorExample extends StatefulWidget {
  @override
  _WebViewGeolocatorExampleState createState() =>
      _WebViewGeolocatorExampleState();
}

class _WebViewGeolocatorExampleState extends State<WebViewGeolocatorExample> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (controller != null) {
          controller.goBack();
        }
        return;
      },
      child: Scaffold(
//        appBar: AppBar(
//          title: const Text('Flutter Example WebView Geolocator '),
//        ),
        body: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return WebViewGeolocator(
              initialUrl: 'https://google.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController wvcontroller) {
                controller = wvcontroller;
              },
            );
          }),
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            controller.goBack();
//          },
//          child: Icon(Icons.arrow_back),
//        ),
      ),
    );
  }
}
