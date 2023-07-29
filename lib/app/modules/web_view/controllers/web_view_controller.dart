import 'package:get/get.dart';

class WebViewController extends GetxController {
  //TODO: Implement WebViewController

  RxString url = "".obs;

  @override
  void onInit() {
    url.value = Get.arguments["url"];
    print(url);
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
