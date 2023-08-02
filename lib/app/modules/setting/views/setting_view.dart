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
        color: const Color.fromRGBO(246,246,246,1),
        margin: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            /* 我的账户 */
            rowComponent(),
            logoutComponent()
          ],
        ),
      ),
    );
  }

  /* 头部标题 */
  headerComponent(){
    return Container(
      color:Colors.white,
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
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
            child: Text(
              controller.titleName.value,
              style:const TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  /**单列模块 */
  rowComponent(){
    return InkWell(
      onTap:(){
        Get.toNamed("/setAccount");
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Text(
                "账户与安全",
                style: TextStyle(
                  color: MyTheme.stressFontColor,
                  fontSize: 16
                ),
              ),
            ),
            Container(
              child:const Icon(
                Icons.navigate_next_rounded,
                color: MyTheme.unimportantFontColor,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }

  /**退出按钮 */
  logoutComponent(){
    return InkWell(
      onTap: (){controller.handleLogout();},
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
