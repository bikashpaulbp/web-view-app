import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_view/app/modules/web_view/views/web_view_view.dart';

import '../controllers/media_list_controller.dart';

class MediaListView extends GetView<MediaListController> {
  const MediaListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Media'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onDoubleTap: () {
                        Get.to(() => WebViewView(
                              uri: "https://www.tiktok.com/",
                            ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 195, 195, 195)),
                        child: Center(child: Text("TikTok")),
                      ),
                    ),
                    InkWell(
                      onDoubleTap: () {
                        Get.to(() => WebViewView(
                              uri: "https://www.bigo.tv/",
                            ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 195, 195, 195)),
                        child: Center(child: Text("Bigo")),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onDoubleTap: () {
                        Get.to(() => WebViewView(
                              uri: "https://m.facebook.com/",
                            ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 195, 195, 195)),
                        child: Center(child: Text("Facebook")),
                      ),
                    ),
                    InkWell(
                      onDoubleTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 244, 54, 235)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onDoubleTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 244, 241, 54)),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 57, 54, 244)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
