import 'package:get/get.dart';

import '../controllers/my_index_controller.dart';

class MyIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyIndexController>(
      () => MyIndexController(),
    );
  }
}
