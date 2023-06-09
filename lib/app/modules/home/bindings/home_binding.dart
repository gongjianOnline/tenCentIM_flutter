import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import "../../IM/im_index/controllers/im_index_controller.dart";
import "../../MY/my_index/controllers/my_index_controller.dart";
import "../../BOOK/book_index/controllers/book_index_controller.dart";

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ImIndexController>(
      () => ImIndexController(),
    );
    Get.lazyPut<MyIndexController>(
      () => MyIndexController(),
    );
    Get.lazyPut<BookIndexController>(
      () => BookIndexController(),
    );
    
  }
}
