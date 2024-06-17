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
    double progressIndicatior = 0;
    
    late InAppWebViewController inAppWebViewController;

    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await inAppWebViewController.canGoBack();

        if (isLastPage) {
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
                    progressIndicatior = progress / 100;
                  });
                },
              ),
              progressIndicatior < 1
                  ? Container(
                      child: LinearProgressIndicator(value: progressIndicatior),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
