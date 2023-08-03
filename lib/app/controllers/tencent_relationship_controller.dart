
import 'package:flutter_im/app/common/remind.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimFriendshipListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_application_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_response_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_operation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application_result.dart';
/* 监听关系链 */
class TencentRelationshipController extends GetxController {


  /* 声明懒变量用于存放好友关系链的配置 */
  late V2TimFriendshipListener listener;

  /* 好友申请列表 */
  RxList<V2TimFriendApplication> friendApplyList = <V2TimFriendApplication>[].obs;
  
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

    /* 配置好友关系链 */
    configRelation(){
      /* 配置关系链监听器 */
      listener = V2TimFriendshipListener(
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
              friendApplyList.insertAll(0,applicationList);
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
    }

    /* 初始化监听器 */
    initRelationshipObserver(){
      configRelation();
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

    /**添加好友 */
    tencentAddFriend(friendId)async{
      V2TimValueCallback<V2TimFriendOperationResult> addFriendRes =
        await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .addFriend(
          userID: friendId,//需要添加的用户id
          remark: "", //添加的好友的好友备注
          friendGroup: "", //添加好友所在分组
          addWording: "", //添加好友附带信息
          addSource: "", //添加来
          addType:FriendTypeEnum.V2TIM_FRIEND_TYPE_BOTH,//设置加好友类型，默认双向
        );
      print(addFriendRes.code);
      if (addFriendRes.code == 0) {
        Remind.toast("等待对方同意");
      }
    }

    /* 获取好友请求列表(在重新登录或进入APP时调用该接口) */
    tencentGetFriendApply()async{
      V2TimValueCallback<V2TimFriendApplicationResult>
        getFriendApplicationListRes = await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .getFriendApplicationList();
      if(getFriendApplicationListRes.code == 0){
        print("未读数量-${getFriendApplicationListRes.data?.unreadCount}");
        // friendApplyList.addAll( as Iterable<V2TimFriendApplication>);
        getFriendApplicationListRes.data?.friendApplicationList?.forEach((element) {
          friendApplyList.add(element as V2TimFriendApplication);
        });
      }

    }

    /* 同意好友申请 */
    tencentConsentFriendApply(V2TimFriendApplication friendInfo)async{
      V2TimValueCallback<V2TimFriendOperationResult>
        acceptFriendApplicationRes = await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .acceptFriendApplication(
                responseType: FriendResponseTypeEnum.V2TIM_FRIEND_ACCEPT_AGREE_AND_ADD, //建立好友关系时选择单向/双向好友关系
                type: FriendApplicationTypeEnum.values[friendInfo.type], //加好友类型 要与getApplicationList查询到的type相同，否则会报错。
                userID: friendInfo.userID);
      if(acceptFriendApplicationRes.code == 0){
        Remind.toast("好友添加成功");
        friendApplyList.removeWhere((item) => item.userID == friendInfo.userID);
        friendApplyList.refresh();
      }
    }

    /* 拒绝好友申请 */
    tencentConsentFriendRefuse(V2TimFriendApplication friendInfo)async{
      V2TimValueCallback<V2TimFriendOperationResult>
            refuseFriendApplicationRes = await TencentImSDKPlugin.v2TIMManager
                .getFriendshipManager()
                .refuseFriendApplication(
                    type: FriendApplicationTypeEnum.V2TIM_FRIEND_APPLICATION_COME_IN, /**官方文档有误，需要将参数写死 */
                    userID: friendInfo.userID);
      if(refuseFriendApplicationRes.code == 0){
        Remind.toast("拒绝添加好友");
        friendApplyList.removeWhere((item) => item.userID == friendInfo.userID);
        friendApplyList.refresh();
      }
    }


}
