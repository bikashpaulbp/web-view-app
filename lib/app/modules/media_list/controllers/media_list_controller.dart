import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_view/app/model/web_model.dart';

class MediaListController extends GetxController {
  RxList<WebModel> webList = RxList();

  RxBool isLoading = false.obs;
  var webBox = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    getList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getList() {
    final webBox = GetStorage();
    var result = webBox.read("web");

    if (result != null) {
      if (result is List) {
        // Check if the list contains Map<String, dynamic> directly
        if (result.isNotEmpty && result.first is Map<String, dynamic>) {
          webList.value = result.map<WebModel>((webModel) => WebModel.fromJson(webModel)).toList();
        }
      } else if (result is String) {
        // Decode if it's a JSON string
        List<dynamic> jsonData = jsonDecode(result);
        webList.value = jsonData.map<WebModel>((webModel) => WebModel.fromJson(webModel)).toList();
      }
    } else {
      webList.value = [];
    }
  }

  // Future<void> saveWeb(List<WebModel> webModels) async {
  //   isLoading.value = true;
  //   final prefs = await SharedPreferences.getInstance();
  //   final encodedData = WebModel.encode(webModels);
  //   await prefs.setString('webModelsKey', encodedData);
  //   isLoading.value = false;
  // }

  // Future<List<WebModel>> getWeb() async {
  //   isLoading.value = true;
  //   final prefs = await SharedPreferences.getInstance();
  //   final encodedData = prefs.getString('webModelsKey');
  //   if (encodedData != null) {
  //     isLoading.value = false;
  //     return WebModel.decode(encodedData);
  //   }
  //   isLoading.value = false;
  //   return [];
  // }

  // Future<void> removeWeb(int index) async {
  //   isLoading.value = true;
  //   final prefs = await SharedPreferences.getInstance();
  //   final encodedData = prefs.getString('webModelsKey');
  //   if (encodedData != null) {
  //     final List<WebModel> webModels = WebModel.decode(encodedData);
  //     if (index >= 0 && index < webModels.length) {
  //       webModels.removeAt(index);
  //       final updatedData = WebModel.encode(webModels);
  //       await prefs.setString('webModelsKey', updatedData);
  //       isLoading.value = false;
  //       debugPrint('Item removed successfully!');
  //     } else {
  //       isLoading.value = false;
  //       debugPrint('Invalid index. Item not removed.');
  //     }
  //   } else {
  //     isLoading.value = false;
  //     debugPrint('No data found. Item not removed.');
  //   }
  // }
}
