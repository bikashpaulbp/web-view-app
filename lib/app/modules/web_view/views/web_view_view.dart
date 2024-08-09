import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import '../controllers/web_view_controller.dart';

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
                initialUrlRequest: URLRequest(url: WebUri(uri!)),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged: (InAppWebViewController controller, int progress) {
                  setState(() {
                    progressIndicator = progress / 100;
                  });
                },
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: false, // Allows automatic media playback
                  allowsInlineMediaPlayback: true, // Allows inline playback on iOS
                ),
                onPermissionRequest: (controller, request) async {
                  return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT,
                  );
                },
              ),
              progressIndicator < 1 ? LinearProgressIndicator(value: progressIndicator) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
