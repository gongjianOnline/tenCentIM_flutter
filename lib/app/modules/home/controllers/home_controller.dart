import 'package:get/get.dart';

import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/constants.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_scankit/flutter_scankit.dart';

import "../../../controllers/tencent_user_controller.dart";

class HomeController extends GetxController {
  /*调用腾讯云用户登录模块 */
  TencentUserController tencentUserController = Get.find();
  
  /**建立控制器和视图层关联 */
  RxString titleName = "消息".obs;
  /* 实例化扫码变量 */
  late FlutterScankit scanKit;
  /**扫一扫相关配置 */
  /* 相机和外部存储权限(获取安卓权限) */
  final permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];
  /* 相机和外部存储权限(获取iod权限) */
  final permissionGroup = const [
    PermissionGroup.Camera,
    PermissionGroup.Photos
  ];



  @override
  void onInit() {
    super.onInit();
    /**监听扫一扫的结果 */
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      print(val);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /*扫一扫*/
  searchCodeFn() async{
    if (!await FlutterEasyPermission.has(perms: permissions,permsGroup:permissionGroup)) {
      FlutterEasyPermission.request(perms:permissions,permsGroup:permissionGroup);
    } else {
      try {
        await scanKit.startScan(scanTypes: [ScanTypes.ALL]);
      } on PlatformException {
        print("扫一扫报错");
      }
    }
  }

}
