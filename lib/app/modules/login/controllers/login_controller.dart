import 'package:get/get.dart';
import 'package:tencent_mi_flutter/app/common/unifyUI.dart';
import "../../../common/api/login.dart";
import '../../../common/im_controller.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  IMController imController = Get.find();

  RxString title = "IM即时聊天".obs;

  RxString userCode = "".obs;

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

  handelChange(value){
    userCode.value = value;
  }

  handelLogin()async{
    print(userCode.value);
    // Get.offNamed("/home");
    if(userCode.value == ""){
      UnifyUI.alter("用户名不能为空");
      return;
    }
    var response =await LoginApi.login({
      "name":userCode.value
    });
    imController.tenCentLogin(userCode.value, response["data"]['sig']);
  }

}
