import 'package:get/get.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_relationship_controller.dart';
import '../../../model/friendInfo.dart';

class AddFriendController extends GetxController {
  /* 调用腾讯关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "添加朋友".obs;

  /* 搜索输入框 */
  RxString searchValue = "".obs;
  /**好友资料 */
  Rx<FriendInfo> friendObj = FriendInfo().obs;

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

  /* 监听搜索框 */
  handelSearch(val){
    searchValue.value = val;
    EasyDebounce.debounce(
      'search_friend', 
      const Duration(seconds: 1), 
      ()async{
        if(searchValue.value != ""){
          List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(searchValue.value);
          if(result.isNotEmpty){
            V2TimFriendInfoResult resultItem = result[0];
            friendObj.value = FriendInfo(
              relation:filterFriendInfo(resultItem.relation,"int"),
              userID : filterFriendInfo(resultItem.friendInfo!.userID,"string"),
              allowType: filterFriendInfo(resultItem.friendInfo?.userProfile?.allowType,"int"),
              birthday : filterFriendInfo(resultItem.friendInfo?.userProfile?.birthday,"int"),
              gender : filterFriendInfo(resultItem.friendInfo?.userProfile?.gender,"int"),
              nickName : filterFriendInfo(resultItem.friendInfo?.userProfile?.nickName,"string"),
              selfSignature  : filterFriendInfo(resultItem.friendInfo?.userProfile?.selfSignature ,"string"),
            );
          }
        }
        
      }
    );
  }

  /* 过滤好友信息 */
  filterFriendInfo(data,type){
    switch (type) {
      case "int":
        return (data == null)?1:data;
      case "string":
        return (data == null || data == "")?"":data;
    }
  }



}
