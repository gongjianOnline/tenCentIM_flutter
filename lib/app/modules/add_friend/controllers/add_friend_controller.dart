import 'package:flutter_im/app/api/userApi.dart';
import 'package:get/get.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';

import '../../../controllers/tencent_relationship_controller.dart';
import '../../../controllers/tencent_user_controller.dart';
import '../../../model/FriendsModel.dart';
import '../../../model/friendInfoModel.dart';

class AddFriendController extends GetxController {
  /* 调用腾讯关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();
  TencentUserController tencentUserController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "添加朋友".obs;

  /* 搜索输入框 */
  RxString searchValue = "".obs;
  /**好友资料 */
  Rx<FriendInfo> friendObj = FriendInfo().obs;

  /*登录用户id
   * 防止用户自己搜自己,当好友id和登录Id相同时直接跳转my页面 
   */
  RxString selfID = "".obs;

  @override
  void onInit() {
    super.onInit();
    /**获取登录用户信息 */
    handelGetSelfInfo();
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
    /* 防抖函数 */
    searchValue.value = val;
    EasyDebounce.debounce(
      'search_friend', 
      const Duration(seconds: 1), 
      ()async{
        if(searchValue.value != ""){
          /* 通过好友名称获取好友id,在调取腾讯的API */
          var response =  await UserApi.getFriendID({"friendName":searchValue.value});
          Friends initResponse = Friends.fromJson(response);
          List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(initResponse.data?[0].tcUserId);
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
              faceUrl  : filterFriendInfo(resultItem.friendInfo?.userProfile?.faceUrl ,"string"),
            );
          }
        };
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

  /**获取登录的用户信息 */
  handelGetSelfInfo()async{
    V2TimUserFullInfo result = await tencentUserController.tenCentGetSelfInfo();
    selfID.value = result.userID as String;
  }

}
