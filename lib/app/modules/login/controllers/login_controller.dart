import 'package:get/get.dart';
import "../../../common/api/login.dart";

class LoginController extends GetxController {
  //TODO: Implement LoginController

  RxString title = "IM即时聊天".obs;
  @override
  void onInit() {
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

  handelLogin()async{
    // Get.offNamed("/home");
    var response =await LoginApi.login({
      "name":"admin"
    });
    print("登录参数打印");
    print(response["data"]['sig']);
  }

}
