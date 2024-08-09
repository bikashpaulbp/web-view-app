import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_view/app/modules/web_view/views/audio_focus_manager.dart';

class WebViewController extends GetxController {
  //TODO: Implement WebViewController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _requestAudioFocus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _requestAudioFocus() async {
    try {
      await AudioFocusManager.requestAudioFocus();
    } on PlatformException catch (e) {
      print('Error requesting audio focus: $e');
    }
  }
}
