import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../controllers/state_obs_controller.dart';
import '../../../controllers/tencent_user_controller.dart';

class MyController extends GetxController {
  
  /*建立控制器和视图层关联 */
  RxString titleName = "我的".obs;

  /* 调用腾讯用户登录模块 */
  TencentUserController tencentUserController = Get.find();
  /* 腾讯对象存储模块调用 */
  StateObsController stateObsController = Get.find();

  /*我的信息 */
  Rx<V2TimUserFullInfo> selfInfo = V2TimUserFullInfo().obs;
  
  /* 应用信息 */
  RxString version = "".obs;
  /* 打开相册 */
  final ImagePicker picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    getAppInfo();
    handleGetUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 获取应用版本 */
  getAppInfo()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo);
    version.value = packageInfo.version;
  }

  /* 获取用户信息 */
  handleGetUserInfo()async{
    V2TimUserFullInfo? result = await tencentUserController.tenCentGetSelfInfo();
    if(result != null){
      selfInfo.value = result;
      print(selfInfo.value.userID);
    }
    update();
  }

  /* 上传图片 */
  handelPhoto()async{
    stateObsController.stateOBS();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    var path = image!.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    await stateObsController.handelUpload(path,name);
    handleGetUserInfo();
  }



}
