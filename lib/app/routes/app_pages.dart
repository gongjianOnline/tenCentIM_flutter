import 'package:get/get.dart';

import '../modules/add_friend/bindings/add_friend_binding.dart';
import '../modules/add_friend/views/add_friend_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LAYOUT;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FRIEND,
      page: () => const AddFriendView(),
      binding: AddFriendBinding(),
    ),
  ];
}
