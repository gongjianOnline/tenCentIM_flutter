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
import 'package:tencent_mi_flutter/app/common/global_controller.dart';
import 'package:tencent_mi_flutter/app/common/unifyUI.dart';
import 'package:tencent_mi_flutter/app/common/utils/storage.dart';

// IM 关系链
class IMRelationship extends GetxController  {
  GlobalController globalController = Get.find();
  
  @override
  void onInit() async {
    super.onInit();
    //设置关系链监听器
    V2TimFriendshipListener listener = V2TimFriendshipListener(
      onFriendApplicationListAdded: (List<V2TimFriendApplication> applicationList) async {
        //好友请求数量增加的回调
        //applicationList 新增的好友请求信息列表
        print("添加好友请求打印");
        print(applicationList[0].type);
        globalController.addFriendList.value = applicationList;
      }
    );
    TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .addFriendListener(listener: listener); //添加关系链监听器
  }

  @override
  void onClose(){
    super.onClose();
  }


  // 添加好友
  addFriend(String userID)async{
        //添加好友
    V2TimValueCallback<V2TimFriendOperationResult> addFriendRes = await TencentImSDKPlugin.v2TIMManager.getFriendshipManager().addFriend(
      userID: userID, //需要添加的用户id
      remark: "", //添加的好友的好友备注
      friendGroup: "", //添加好友所在分组
      addWording: "", //添加好友附带信息
      addSource: "", //添加来源描述
      addType: FriendTypeEnum.V2TIM_FRIEND_TYPE_BOTH, //设置加好友类型，默认双向
    );
    if (addFriendRes.code == 0) {
      print("添加请求发送成功");
      print(addFriendRes.data?.resultCode);
      print(addFriendRes.data?.resultInfo);
      print(addFriendRes.data?.userID);
    }
  }

  // 获取好友申请列表
  friendApplication()async{
    V2TimValueCallback<V2TimFriendApplicationResult> getFriendApplicationListRes = await TencentImSDKPlugin.v2TIMManager
      .getFriendshipManager()
      .getFriendApplicationList();
    if(getFriendApplicationListRes.code == 0){
      print("好友申请列表查询成功");
      print(getFriendApplicationListRes.data?.unreadCount);
      print(getFriendApplicationListRes.data?.friendApplicationList);
    }else{
      print("好友申请列表查询失败");
    }
  }


}