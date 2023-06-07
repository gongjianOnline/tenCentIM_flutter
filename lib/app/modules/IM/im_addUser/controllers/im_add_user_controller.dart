import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_mi_flutter/app/common/im_controller.dart';

class ImAddUserController extends GetxController {
  //TODO: Implement ImAddUserController
  IMController imController = Get.find();

  RxString textName = "admin".obs;

  RxString searchCode = "".obs;
  RxInt searchStatus = 0.obs; // 用于判断搜索结果 0表示有结果 1标识无结果
  RxList searchList = [].obs;
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

  // 搜索框
  handelSearch(value){
    searchCode.value = value;
  }
  // 提交搜索
  submitSearch()async{
    searchList.value = [];
    V2TimUserFullInfo? searchInfo = await imController.queryUserInfo(searchCode.value);
    if(searchInfo != null){
      searchStatus.value = 0;
      searchList.add(searchInfo);
    }else{
      searchStatus.value = 1;
    }
    
  }


}
