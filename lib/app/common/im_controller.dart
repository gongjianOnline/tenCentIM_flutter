import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TIMManager.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimAdvancedMsgListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimFriendshipListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimGroupListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSDKListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSignalingListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSimpleMsgListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/at_info_types.dart';
import 'package:tencent_cloud_chat_sdk/enum/callbacks.dart';
import 'package:tencent_cloud_chat_sdk/enum/conversation_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_application_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_response_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/friend_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/get_group_message_read_member_list_filter.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_add_opt_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_add_opt_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_application_handle_result.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_application_handle_status.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_application_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_application_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_change_info_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_member_filter_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_member_filter_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_member_role.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_member_role_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_tips_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/group_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/history_message_get_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/history_msg_get_type_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/image_types.dart';
import 'package:tencent_cloud_chat_sdk/enum/listener_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/log_level.dart';
import 'package:tencent_cloud_chat_sdk/enum/log_level_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_priority.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_priority_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_status.dart';
import 'package:tencent_cloud_chat_sdk/enum/offlinePushInfo.dart';
import 'package:tencent_cloud_chat_sdk/enum/receive_message_opt_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/simpleMsgListenerType.dart';
import 'package:tencent_cloud_chat_sdk/enum/user_info_allow_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/utils.dart';
import 'package:tencent_cloud_chat_sdk/enum/v2_tim_conversation_marktype.dart';
import 'package:tencent_cloud_chat_sdk/enum/v2_tim_keyword_list_match_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/v2_tim_plugins.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_conversation_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_friendship_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_group_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_message_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_offline_push_manager.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_signaling_manager.dart';
import 'package:tencent_cloud_chat_sdk/models/user_status_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_application_processed.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversationList_filter.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation_operation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_custom_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_face_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_file_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_check_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_group.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_operation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_search_param.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_grant_administrator.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_application.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_application_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_at_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_attribute_changed.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_change_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_created.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_dismissed.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_info_changed.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_change_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_full_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_operation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_search_param.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_member_search_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_message_read_member_list.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_recycled.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_search_param.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_group_tips_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_image.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_image_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_location_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member_enter.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member_info_changed.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member_invited.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member_kicked.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_member_leave.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_merger_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_change_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_download_progress.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_extension.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_extension_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_list_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_online_url.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_receipt.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_search_param.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_search_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_search_result_item.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_msg_create_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_offline_push_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_quit_from_group.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_receive_message_opt_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_receive_rest_custom_data.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_recv_c2c_custom_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_recv_c2c_text_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_recv_group_custom_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_recv_group_text_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_revoke_administrator.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_signaling_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_sound_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_text_elem.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_topic_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_topic_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_topic_operation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_status.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_video_elem.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';
import 'package:tencent_mi_flutter/app/common/im_relationship.dart';
import 'package:tencent_mi_flutter/app/common/unifyUI.dart';
import 'package:tencent_mi_flutter/app/common/utils/storage.dart';

class IMController extends GetxController  {
    IMRelationship imRelationship = Get.find();
  
   // 1. 从即时通信 IM 控制台获取应用 SDKAppID。
    int sdkAppID = 1400813777;
    

  @override
  void onInit() async {
    super.onInit();
    // 2. 添加 V2TimSDKListener 的事件监听器，sdkListener 是 V2TimSDKListener 的实现类
    V2TimSDKListener sdkListener = V2TimSDKListener(
      onConnectFailed: (int code, String error) {
        // 连接失败的回调函数
        // code 错误码
        // error 错误信息
        print("连接失败");
        print(code);
        print(error);
      },
      onConnectSuccess: () {
        // SDK 已经成功连接到腾讯云服务器
        print("已经成功连接到腾讯云服务器");
      },
      onConnecting: () {
        // SDK 正在连接到腾讯云服务器
        print("正在连接到腾讯云服务器");
      },
      onKickedOffline: () {
        // 当前用户被踢下线，此时可以 UI 提示用户，并再次调用 V2TIMManager 的 login() 函数重新登录。
        UnifyUI.alter("当前用户被踢下线");
        Get.offAllNamed("/login");
      },
      onSelfInfoUpdated: (V2TimUserFullInfo info) {
        // 登录用户的资料发生了更新
        // info登录用户的资料
      },
      onUserSigExpired: () {
        // 在线时票据过期：此时您需要生成新的 userSig 并再次调用 V2TIMManager 的 login() 函数重新登录。
        UnifyUI.alter("登录过期请重新登录");
        Get.offAllNamed("/login");
      },
      onUserStatusChanged: (List<V2TimUserStatus> userStatusList) {
        //用户状态变更通知
        //userStatusList 用户状态变化的用户列表
        //收到通知的情况：订阅过的用户发生了状态变更（包括在线状态和自定义状态），会触发该回调
        //在 IM 控制台打开了好友状态通知开关，即使未主动订阅，当好友状态发生变更时，也会触发该回调
        //同一个账号多设备登录，当其中一台设备修改了自定义状态，所有设备都会收到该回调
      },
    );

    // 3.初始化SDK
    V2TimValueCallback<bool> initSDKRes = await TencentImSDKPlugin.v2TIMManager.initSDK(
      sdkAppID: sdkAppID, // SDKAppID
      loglevel: LogLevelEnum.V2TIM_LOG_NONE, // 日志登记等级
      listener: sdkListener, // 事件监听器
    );
    if (initSDKRes.code == 0) {
      //初始化成功
      print("tenCentIM初始化成功");
    }


  }

  @override
  void onClose(){
    super.onClose();
  }

  // 腾讯云用户登录
  tenCentLogin(userID,userSig)async{
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager.login(userID: userID, userSig: userSig);
    if(res.code == 0){
      // 登录成功逻辑
      Get.offNamed("/home");
      tenCentUserInfo();
      // 获取好友列表
      imRelationship.getFriendList();
    }else{
      UnifyUI.alter("登录失败");
    }
  }

  // 腾讯云用户退出
  tenCentLogout()async{
    V2TimCallback logoutRes = await TencentImSDKPlugin.v2TIMManager.logout();
    if(logoutRes.code == 0){
      // 退出成功
      Storage.removeData("userInfo");
      Get.offNamed("/login");
    }else{
      UnifyUI.alter("退出失败");
    }
  }

  // 腾讯云获取用户信息
  Future tenCentUserInfo()async{
    V2TimValueCallback<String> getLoginUserRes = await TencentImSDKPlugin.v2TIMManager.getLoginUser();
    if (getLoginUserRes.code == 0) {
      // 存入本地(目前只能获取用户名)
      Storage.setData("userInfo",getLoginUserRes.data);
    }
  }
  // 拉去会话列表
  tenCentSessionList()async{
    V2TimValueCallback<V2TimConversationResult> getConversationListRes = await TencentImSDKPlugin.v2TIMManager.getConversationManager().getConversationList(nextSeq: '0',count: 100);
    if (getConversationListRes.code == 0) {
      //拉取成功
      bool? isFinished = getConversationListRes.data?.isFinished;//是否拉取完
      String? nextSeq = getConversationListRes.data?.nextSeq;//后续分页拉取的游标
      List<V2TimConversation?>? conversationList =
          getConversationListRes.data?.conversationList;//此次拉取到的消息列表
      //如果没有拉取完，使用返回的nextSeq继续拉取直到isFinished为true
      if (!isFinished!) {
        V2TimValueCallback<V2TimConversationResult> nextConversationListRes =
            await TencentImSDKPlugin.v2TIMManager
                .getConversationManager()
                .getConversationList(count: 100, nextSeq: nextSeq = "0");//使用返回的nextSeq继续拉取直到isFinished为true
      }
      print("测试打印会话列表");
      print(conversationList);
    }
  }

  // 查询其他用户资料(当前主要用于添加好友的好友查找)
  queryUserInfo(userID)async{
    V2TimValueCallback<List<V2TimUserFullInfo>> getUsersInfoRes = await TencentImSDKPlugin.v2TIMManager.getUsersInfo(userIDList: [userID]);//需要查询的用户id列表
    if (getUsersInfoRes.code == 0) {
      return getUsersInfoRes.data?[0];
    }else{
      return null;
    }
  }









}