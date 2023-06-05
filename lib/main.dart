import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import "./app/common/im_controller.dart";

void main() async{
  await Get.put(IMController());
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
