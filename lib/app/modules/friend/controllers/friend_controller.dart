import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';

import '../../../controllers/tencent_relationship_controller.dart';

class FriendController extends GetxController {

  /* 建立视图层和控制器关联 */
  RxString titleName = "好友".obs;
  TencentRelationshipController tencentRelationshipController = Get.find();

  /* 搜索表单控制器 */
  RxString friendSearch = "".obs;

  /* 好友列表 */
  RxList<V2TimFriendInfo?> friendList = <V2TimFriendInfo>[].obs;

  @override
  void onInit() async {
    super.onInit();;
    /* 获取好友列表 */
    await tencentRelationshipController.tencentGetFriendList();
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 监听输入框 */
  handelFriendSearch(val){
    friendSearch.value = val;
    List<V2TimFriendInfo?> asFriendList = tencentRelationshipController.friendList;
    if(friendSearch.value == ""){
      friendList.value = asFriendList;
    }else{
      friendList.value = asFriendList.where((element) => element!.userProfile!.nickName!.contains(friendSearch.value)).toList();
    }
  }

}
