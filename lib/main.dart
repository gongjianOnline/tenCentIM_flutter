import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tencent_mi_flutter/app/common/utils/storage.dart';

import 'app/routes/app_pages.dart';
import "./app/common/im_controller.dart";

void main() async{
  await Get.put(IMController());
  var isLogin = await Storage.getData("userInfo");
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      title: "Application",
      initialRoute: isLogin==null?AppPages.LOGIN:AppPages.HOME,
      getPages: AppPages.routes,
    ),
  );
}
