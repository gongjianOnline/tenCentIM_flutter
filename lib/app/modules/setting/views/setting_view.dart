import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            logoutComponent()
          ],
        ),
      ),
    );
  }

  /* 头部标题 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Row(
        children: [
          InkWell(
            onTap: (){Get.back();},
            child: Container(
              child: const Icon(
                Icons.arrow_back_ios_new,
                color:MyTheme.unimportantFontColor
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              "设置",
              style: TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  /**退出按钮 */
  logoutComponent(){
    return InkWell(
      onTap: (){Get.offAndToNamed("/login");},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "退出登录",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }

}
