import 'package:get/get.dart';

import '../modules/add_friend/bindings/add_friend_binding.dart';
import '../modules/add_friend/views/add_friend_view.dart';
import '../modules/chart/bindings/chart_binding.dart';
import '../modules/chart/views/chart_view.dart';
import '../modules/circle_details/bindings/circle_details_binding.dart';
import '../modules/circle_details/views/circle_details_view.dart';
import '../modules/circle_send/bindings/circle_send_binding.dart';
import '../modules/circle_send/views/circle_send_view.dart';
import '../modules/circle_separate/bindings/circle_separate_binding.dart';
import '../modules/circle_separate/views/circle_separate_view.dart';
import '../modules/friend_info/bindings/friend_info_binding.dart';
import '../modules/friend_info/views/friend_info_view.dart';
import '../modules/friend_new/bindings/new_friend_binding.dart';
import '../modules/friend_new/views/new_friend_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_code/bindings/my_code_binding.dart';
import '../modules/my_code/views/my_code_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/set_account/bindings/set_account_binding.dart';
import '../modules/set_account/views/set_account_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/web_view/bindings/web_view_binding.dart';
import '../modules/web_view/views/web_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
    GetPage(
      name: _Paths.FRIEND_INFO,
      page: () => const FriendInfoView(),
      binding: FriendInfoBinding(),
    ),
    GetPage(
      name: _Paths.CHART,
      page: () => const ChartView(),
      binding: ChartBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => const WebViewView(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: _Paths.CIRCLE_DETAILS,
      page: () => const CircleDetailsView(),
      binding: CircleDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CIRCLE_SEND,
      page: () => const CircleSendView(),
      binding: CircleSendBinding(),
    ),
    GetPage(
      name: _Paths.CIRCLE_SEPARATE,
      page: () => const CircleSeparateView(),
      binding: CircleSeparateBinding(),
    ),
    GetPage(
      name: _Paths.MY_CODE,
      page: () => const MyCodeView(),
      binding: MyCodeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SET_ACCOUNT,
      page: () => const SetAccountView(),
      binding: SetAccountBinding(),
    ),
    GetPage(
      name: _Paths.NEW_FRIEND,
      page: () => NewFriendView(),
      binding: NewFriendBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
