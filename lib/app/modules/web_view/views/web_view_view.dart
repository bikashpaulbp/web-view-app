import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/web_view_controller.dart';

class WebViewView extends GetView<WebViewController> {
  const WebViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WebViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
