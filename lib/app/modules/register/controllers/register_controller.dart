import 'package:flutter_im/app/common/remind.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  /* 建立视图层和数据层关联 */
  RxString authorValue = "@基于Flutter即时通信案例".obs;

  /*用户名 & 密码 & 确认密码 */
  RxString userName = "".obs;
  RxString passWord = "".obs;
  RxString passWords = "".obs;


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

  /* 监听用户名 */
  handleUserName(val){
    userName.value = val;
  }
  /*监听密码 */
  handlePassWord(val){
    passWord.value = val;
  }
  /* 监听确认密码 */
  handlePassWords(val){
    passWords.value = val;
  }
  /* 注册 */
  handelRegister(){
    if(passWord.value != passWords.value){
      Remind.toast("两次密码不一致");
      return;
    }
    if(userName.value=="" || passWord.value=="" || passWords.value == ""){
      Remind.toast("信息不能为空");
      return;
    }


    
  }


}
