import 'package:flutter/material.dart';
import 'package:flutter_im/app/bindings/global_bindings.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import 'app/controllers/init_tencent_im_controller.dart';
import 'app/controllers/tencent_message_controller.dart';
import 'app/controllers/tencent_relationship_controller.dart';
import 'app/controllers/tencent_session_controller.dart';
import 'app/controllers/tencent_user_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() async {
  /** 调用初始化腾讯云SDK */
  Get.put(InitTencentImController());
  Get.put(TencentUserController());
  Get.put(TencentRelationshipController());
  Get.put(TencentMessageController());
  Get.put(TencentSessionController());
  
  
  /*更改状态栏颜色 */
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor:MyTheme.themeColor, // 设置状态栏背景为透明色
    statusBarIconBrightness: Brightness.light, // 设置状态栏颜色为白色; Brightness.dark 设置字体为黑色
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Application",
      theme: ThemeData( 
        colorScheme: const ColorScheme.light().copyWith(primary: MyTheme.themeColor),
      ),
      initialBinding: GlobalBindings(),
      defaultTransition: Transition.rightToLeftWithFade, // 路由切换动画
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
