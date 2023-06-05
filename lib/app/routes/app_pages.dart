import 'package:get/get.dart';

import '../modules/IM/im_talk/bindings/im_talk_binding.dart';
import '../modules/IM/im_talk/views/im_talk_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/IM/im_addUser/bindings/im_add_user_binding.dart';
import '../modules/IM/im_addUser/views/im_add_user_view.dart';

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
      name: _Paths.IM_TALK,
      page: () => const ImTalkView(),
      binding: ImTalkBinding(),
    ),
    GetPage(
      name: _Paths.IM_ADD_USER,
      page: () => const ImAddUserView(),
      binding: ImAddUserBinding(),
    ),
  ];
}
