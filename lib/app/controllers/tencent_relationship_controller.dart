import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimFriendshipListener.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';
/* 监听关系链 */
class TencentRelationshipController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    initRelationshipObserver();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    destroyRelationshipObserver();
  }

    /* 配置关系链监听器 */
    V2TimFriendshipListener listener = V2TimFriendshipListener(
      onBlackListAdd: (List<V2TimFriendInfo> infoList) async {
        print("关系链监听到黑名单列表新增用户");
        //黑名单列表新增用户的回调
        //infoList 新增的用户信息列表
      },
      onBlackListDeleted: (List<String> userList) async {
        print("关系链监听到黑名单列表删除用户");
        //黑名单列表删除的回调
        //userList 被删除的用户id列表
      },
      onFriendApplicationListAdded:
          (List<V2TimFriendApplication> applicationList) async {
            print("关系链监听到好友请求信息增加");
        //好友请求数量增加的回调
        //applicationList 新增的好友请求信息列表
      },
      onFriendApplicationListDeleted: (List<String> userIDList) async {
        print("关系链监听到好友请求信息减少");
        //好友请求数量减少的回调
        //减少的好友请求的请求用户id列表
      },
      onFriendApplicationListRead: () async {
        print("关系链监听到好友请求已读");
        //好友请求已读的回调
      },
      onFriendInfoChanged: (List<V2TimFriendInfo> infoList) async {
        print("关系链监听到好友信息改变");
        //好友信息改变的回调
        //infoList 好友信息改变的好友列表
      },
      onFriendListAdded: (List<V2TimFriendInfo> users) async {
        print("关系链监听到好友列表增加");
        //好友列表增加人员的回调
        //users 新增的好友信息列表
      },
      onFriendListDeleted: (List<String> userList) async {
        print("关系链监听到好友列表减少");
        //好友列表减少人员的回调
        //userList 减少的好友id列表
      },
    );

    /* 初始化监听器 */
    initRelationshipObserver(){
      TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .addFriendListener(listener: listener);//添加关系链监听器
    }
    
    /**移除监听器 */
    destroyRelationshipObserver(){
      TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .removeFriendListener(listener: listener);//需要移除的关系链监听器
    }

    /* 获取好友资料 */
    Future tencentGetFriendInfo(friedId)async{
      V2TimValueCallback<List<V2TimFriendInfoResult>> getFriendsInfoRes =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .getFriendsInfo(userIDList: [friedId]);
      if(getFriendsInfoRes.code == 0){
        return getFriendsInfoRes.data;
      }
    }



}
