import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_view/app/model/web_model.dart';
import 'package:web_view/app/modules/web_view/views/web_view_view.dart';

import '../controllers/media_list_controller.dart';

class MediaListView extends GetView<MediaListController> {
  const MediaListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaListController controller = Get.put(MediaListController());

    TextEditingController addressController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    void addWebModalSheet(BuildContext ctx) {
      showModalBottomSheet<void>(
        enableDrag: true,
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        context: ctx,
        builder: (ctx) => Container(
          width: 250,
          height: 600,
          color: Colors.white54,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Use OutlineInputBorder
                    labelText: 'Paste URL',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Use OutlineInputBorder
                    labelText: 'Enter Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.isLoading.value = false;
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isNotEmpty && addressController.text.isNotEmpty) {
                          controller.webList.add(WebModel(address: addressController.text, name: nameController.text));
                          List<Map<String, dynamic>> webListJson = controller.webList.map((webModel) => webModel.toJson()).toList();
                          controller.webBox.write("web", webListJson);
                          controller.webList.refresh();
                          Get.back();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Obx(() => controller.isLoading.value ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator()) : Text('Save')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                addWebModalSheet(context);
              },
              icon: Icon(Icons.add))
        ],
        title: const Text('Choose Media'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => GridView.builder(
              itemCount: controller.webList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Horizontal space between grid items
                mainAxisSpacing: 10.0, // Vertical space between grid items
                childAspectRatio: 3 / 2, // Adjust aspect ratio of the grid items if needed
              ),
              itemBuilder: (context, index) {
                WebModel webList = controller.webList[index];
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onDoubleTap: () {
                        Get.to(() => WebViewView(
                              uri: webList.address,
                            ));
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.3,
                        // height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 45, 234, 215).withOpacity(0.8)),
                        child: Center(
                            child: Text(
                          webList.name!,
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.webList.removeAt(index);
                        List<Map<String, dynamic>> updatedList = controller.webList.map((webModel) => webModel.toJson()).toList();
                        controller.webBox.write("web", updatedList);
                        controller.webList.refresh();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
