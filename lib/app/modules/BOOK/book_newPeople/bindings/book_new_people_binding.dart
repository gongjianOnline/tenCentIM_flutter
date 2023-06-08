import 'package:get/get.dart';

import '../controllers/book_new_people_controller.dart';

class BookNewPeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookNewPeopleController>(
      () => BookNewPeopleController(),
    );
  }
}
