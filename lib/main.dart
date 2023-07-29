import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() {
  /*更改状态栏颜色 */
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor:MyTheme.themeColor, // 设置状态栏背景为透明色
      statusBarIconBrightness: Brightness.light, // 设置状态栏颜色为白色; Brightness.dark 设置字体为黑色
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData( 
        colorScheme: const ColorScheme.light().copyWith(primary: MyTheme.themeColor),
      ),
      defaultTransition: Transition.rightToLeftWithFade, // 路由切换动画
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
