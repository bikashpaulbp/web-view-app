import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import '../controllers/web_view_controller.dart';

// ignore: must_be_immutable
class WebViewView extends GetView<WebViewController> {
  String? uri = "";

  WebViewView({this.uri, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressIndicator = 0;

    late InAppWebViewController inAppWebViewController;

    return WillPopScope(
      onWillPop: () async {
        var canGoBack = await inAppWebViewController.canGoBack();
        if (canGoBack) {
          inAppWebViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enjoy'),
          centerTitle: true,
        ),
        body: StatefulBuilder(
          builder: (BuildContext context, setState) => Stack(
            children: [
              InAppWebView(
                keepAlive: InAppWebViewKeepAlive(),
                initialUrlRequest: URLRequest(url: WebUri(uri!)),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) async {
                  await controller.evaluateJavascript(source: """
      document.addEventListener('visibilitychange', function() {
        var video = document.querySelector('video');
        if (video && document.visibilityState === 'hidden') {
          video.play();
        }
      });
    """);
                },
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: false,
                  allowsInlineMediaPlayback: true,
                ),
              ),
              progressIndicator < 1 ? LinearProgressIndicator(value: progressIndicator) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
