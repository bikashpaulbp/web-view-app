import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lock/bindings/lock_binding.dart';
import '../modules/lock/views/lock_view.dart';
import '../modules/media_list/bindings/media_list_binding.dart';
import '../modules/media_list/views/media_list_view.dart';
import '../modules/web_view/bindings/web_view_binding.dart';
import '../modules/web_view/views/web_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOCK,
      page: () => const LockView(),
      binding: LockBinding(),
    ),
    GetPage(
      name: _Paths.MEDIA_LIST,
      page: () => const MediaListView(),
      binding: MediaListBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => WebViewView(),
      binding: WebViewBinding(),
    ),
  ];
}
