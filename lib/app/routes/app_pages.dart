import 'package:get/get.dart';

import '../modules/IM/im_addUser/bindings/im_add_user_binding.dart';
import '../modules/IM/im_addUser/views/im_add_user_view.dart';
import '../modules/IM/im_friendInfo/bindings/im_friend_info_binding.dart';
import '../modules/IM/im_friendInfo/views/im_friend_info_view.dart';
import '../modules/IM/im_talk/bindings/im_talk_binding.dart';
import '../modules/IM/im_talk/views/im_talk_view.dart';
import '../modules/BOOK/book_newPeople/bindings/book_new_people_binding.dart';
import '../modules/BOOK/book_newPeople/views/book_new_people_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const LOGIN = Routes.LOGIN;
  static const HOME = Routes.HOME;

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
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.IM_FRIEND_INFO,
      page: () => const ImFriendInfoView(),
      binding: ImFriendInfoBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_NEW_PEOPLE,
      page: () => const BookNewPeopleView(),
      binding: BookNewPeopleBinding(),
    ),
  ];
}
