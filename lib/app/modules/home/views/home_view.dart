import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_view/app/modules/media_list/views/media_list_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                controller.tapSum.value = "";
              },
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white),
              ))
        ],
        title: const Text('Play Tap Tap'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.tapSum.value = controller.tapSum.value + "1";

                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ),
                    InkWell(
                      onDoubleTap: () {
                        controller.tapSum.value = controller.tapSum.value + "2";
                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 86, 244, 54)),
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
                        controller.tapSum.value = controller.tapSum.value + "3";
                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 54, 219, 244)),
                      ),
                    ),
                    InkWell(
                      onDoubleTap: () {
                        controller.tapSum.value = controller.tapSum.value + "4";
                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
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
                      onDoubleTap: () {
                        controller.tapSum.value = controller.tapSum.value + "5";
                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 244, 241, 54)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.tapSum.value = controller.tapSum.value + "6";
                        if (controller.tapSum.value == controller.pin) {
                          Get.to(MediaListView());
                        }
                      },
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
        ),
      ),
    );
  }
}
