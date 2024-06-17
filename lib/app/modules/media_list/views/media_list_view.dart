import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/media_list_controller.dart';

class MediaListView extends GetView<MediaListController> {
  const MediaListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MediaListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
