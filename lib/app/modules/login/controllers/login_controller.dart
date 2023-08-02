import 'dart:convert';

import 'package:get/get.dart';

import '../../../api/login.dart';
import '../../../model/sigModel.dart';

class LoginController extends GetxController {


  RxString authorValue = "@基于Flutter即时通信案例".obs;

  /* 监听再按一次退出APP */
  var lastPopTime = DateTime.now().obs;


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

  /* 确认退出APP */ 
  setLastPopTime(){
    lastPopTime.value = DateTime.now();
    update();
  }

  /* 登录 */
  handelLogin()async{
    var response =await LoginApi.login({
      "name":"admin"
    });
    Sig sigData = Sig.fromJson(response); // json 字符串转 map
    print(sigData.sig);
    // Get.offAndToNamed("/layout");
  }
  
}
