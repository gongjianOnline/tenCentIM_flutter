import 'package:get/get.dart';

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

  
}
