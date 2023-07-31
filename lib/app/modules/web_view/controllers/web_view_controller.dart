import 'package:get/get.dart';

class WebViewController extends GetxController {
  
  RxString url = "".obs;
  /* 进度条加载 */
  RxDouble schedule = 0.0.obs;
  @override
  void onInit() {
    url.value = Get.arguments["url"];

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
