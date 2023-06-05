import 'package:get/get.dart';

import '../controllers/book_index_controller.dart';

class BookIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookIndexController>(
      () => BookIndexController(),
    );
  }
}
