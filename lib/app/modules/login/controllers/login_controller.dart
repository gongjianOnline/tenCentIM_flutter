

import 'package:get/get.dart';

import '../../../api/login.dart';
import '../../../controllers/tencent_user_controller.dart';
import '../../../model/sigModel.dart';

class LoginController extends GetxController {
  /* 引入腾讯云登录模块 */
  
  TencentUserController tencentUserController = Get.find();

  /* 建立控制器和视图层关联 */
  RxString authorValue = "@基于Flutter即时通信案例".obs;

  /* 监听再按一次退出APP */
  var lastPopTime = DateTime.now().obs;

  /* 登录表单的字段
  * userName 用户名
  * password 密码 
  */
  RxString userName = "".obs;
  RxString password = "".obs;


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

  /*响应式表单数据
  * handleUserName 用户名
  * handlePassword 密码 
   */
  handleUserName(val){
    userName.value = val;
    update();
  }
  handlePassword(){

  }

  /* 登录 */
  handelLogin()async{
    var response =await LoginApi.login({
      "name":userName.value
    });
    Sig sigData = Sig.fromJson(response); // json 字符串转 map
    tencentUserController.tenCentLogin(userName.value, sigData.sig);
  }


  
}
