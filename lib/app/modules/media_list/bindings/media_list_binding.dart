import 'package:get/get.dart';

import '../controllers/media_list_controller.dart';

class MediaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaListController>(
      () => MediaListController(),
    );
  }
}
