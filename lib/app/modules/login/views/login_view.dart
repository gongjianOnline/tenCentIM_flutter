import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_im/app/common/myTheme.dart';


import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/AliIcon.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>WillPopScope(
        onWillPop: ()async{
          /* 判断两秒内点击两次返回按钮则退出APP */
          if(DateTime.now().difference(controller.lastPopTime.value) > const Duration(seconds: 2)){
            Fluttertoast.showToast(
              msg: "在按一次退出应用",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(57, 0, 0, 0),
              textColor: Colors.white,
              fontSize: 16.0
            );
            controller.setLastPopTime();
          }else{
            /* 退出app */
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
          return false;
        },
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: MediaQuery. of (context).size.width,
            height: MediaQuery. of (context).size.height,
            child:Stack(
              children: [
                /* banner背景 */
                bannerComponent(context),
                /**修饰logo */
                logoDecorateComponent(),
                /* logo */
                logoComponent(),
                /* 表单  */
                loginComponent(context),
                /* 作者 */
                authorComponent()
              ],
            )
          ),
        )
      )
    );
  }

  /* logo */
  logoComponent(){
    return Positioned(
      child:  Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SvgPicture.asset("lib/assets/svg/logo.svg"),
        )
      ),
    );  
  }

  /*  修饰logo */
  logoDecorateComponent(){
    return Positioned(
      child:  Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SvgPicture.asset("lib/assets/svg/decorate.svg"),
        )
      ),
    );
  }

  /* 背景banner图 */
  bannerComponent(context){
    return Container(
      width: MediaQuery. of (context).size.width,
      height: 260,
      decoration: const BoxDecoration(
        color: MyTheme.themeColor
      ),
      child: Container(),
    );
  }

  /* 登录框 */
  loginComponent(context){
    return Positioned(
      top: 180,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(40),
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration:  BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* 账号&密码&忘记密码 */
            Container(
              child: Column(
                children: [
                  /* 用户名 */
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "账号", // 提示词
                        border: InputBorder.none, // 带边框
                        contentPadding: EdgeInsets.symmetric(vertical:9,horizontal:0),
                        icon:Padding( /*给左边添加图标*/
                          padding:  EdgeInsets.only(left: 10,),
                          child: Icon(
                            AliIcon.my,
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        ),
                      ),
                      onChanged: (val)=>{
                        controller.handleUserName(val)
                      },
                    ),
                  ),

                  /* 密码 */
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:TextField(
                      maxLines: 1,
                      decoration:const InputDecoration(
                        hintText: "密码", // 提示词
                        border: InputBorder.none, // 带边框
                        contentPadding: EdgeInsets.symmetric(vertical:9,horizontal:0),
                        icon:Padding( /*给左边添加图标*/
                          padding:  EdgeInsets.only(left: 10,),
                          child: Icon(
                            AliIcon.password,
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        )
                      ),
                      onChanged: (val){controller.handlePassword(val);},
                    ),
                  ),

                  /* 忘记密码 */
                  InkWell(
                    onTap: (){Get.toNamed("/register");},
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.centerRight,
                      child:const Text(
                        "前往注册",
                        style: TextStyle(
                          color: MyTheme.themeColor
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),

            /* 登录 */
            InkWell(
              onTap: (){
                controller.handelLogin();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyTheme.themeColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                width:MediaQuery.of(context).size.width,
                height: 40,
                child: const Text(
                  "登录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              ),
            )

          ],
        ),
      )
    );
  }

  /*作者声明 */
  authorComponent(){
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding:const EdgeInsets.only(bottom: 30),
          child: Text(
            controller.authorValue.value,
            style: const TextStyle(
              color: MyTheme.unimportantFontColor
            ),
          ),
        ),
      )
    );
  }



}
