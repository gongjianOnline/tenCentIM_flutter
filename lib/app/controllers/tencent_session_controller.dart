import 'package:flutter_im/app/common/remind.dart';
import 'package:get/get.dart';

import 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_priority_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/offlinePushInfo.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_msg_create_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';


class TencentSessionController extends GetxController {
  
  /* 会话监听器 */
  late V2TimConversationListener listener;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tencentInitSession();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 配置会话间监听对象 */
  configSessionObj(){
    listener = V2TimConversationListener(
      onConversationChanged: (List<V2TimConversation> conversationList) {
        //某些会话的关键信息发生变化（未读计数发生变化、最后一条消息被更新等等）的回调函数
        //conversationList    变化的会话列表
        print("会话监听未读数或最后一条消息更新");
      },
      onConversationGroupCreated:
          (String groupName, List<V2TimConversation> conversationList) {
        // 会话分组被创建
        // groupName 会话分组名称
        // conversationList 会话分组包含的会话列表
        print("会话分组被创建");
      },
      onConversationGroupDeleted: (String groupName) {
        // 会话分组被删除
        // groupName  被删除的会话分组名称
        print("会话分组被删除");
      },
      onConversationGroupNameChanged: (String oldName, String newName) {
        // 会话分组名变更
        // oldName 旧名称
        // newName 新名称
        print("会话分组名变更");
      },
      onConversationsAddedToGroup:
          (String groupName, List<V2TimConversation> conversationList) {
        // 会话分组新增会话
        // groupName 会话分组名称
        // conversationList 被加入会话分组的会话列表
        print("会话分组新增会话");
      },
      onConversationsDeletedFromGroup:
          (String groupName, List<V2TimConversation> conversationList) {
        // 会话分组删除会话
        // groupName 会话分组名称
        // conversationList 被删除的会话列表
        print("会话分组删除会话");
      },
      onNewConversation: (List<V2TimConversation> conversationList) {
        // 新会话的回调函数
        // conversationList 收到的新会话列表
        print("新会话的回调函数");
      },
      onSyncServerFailed: () {
        // 同步服务失败的回调函数
        print("同步服失败回调");
      },
      onSyncServerFinish: () {
        // 同步服务完成的回调函数
        print("同步服务完成的回调函数");
      },
      onSyncServerStart: () {
        // 同步服务开始的回调函数
        print("同步服务开始的回调函数");
      },
      onTotalUnreadMessageCountChanged: (int totalUnreadCount) {
        // 会话未读总数改变的回调函数
        // totalUnreadCount 会话未读总数
        print("会话未读总数改变的回调函数");
      },
    );
  }
  
  /* 初始化会话监听 */
  tencentInitSession(){
    configSessionObj();
    TencentImSDKPlugin.v2TIMManager
        .getConversationManager()
        .addConversationListener(listener: listener);
  }

  /* 单聊文本消息 */
  tencentTextMessage(String text,String userID)async{
    V2TimValueCallback<V2TimMsgCreateInfoResult> createTextMessageRes =
      await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .createTextMessage(
          text: text, // 文本信息
        );
    tencentSendMessage(createTextMessageRes.data?.id as String,userID);
  }
  /* 单聊发送消息 */
  tencentSendMessage(String createTextMessageResId,String userID)async{
    V2TimValueCallback<V2TimMessage> sendMessageRes =
      await TencentImSDKPlugin.v2TIMManager.getMessageManager().sendMessage(
          id: createTextMessageResId, // 创建的messageid
          receiver: userID, // 接收人id
          groupID:"", //群组id
          priority: MessagePriorityEnum.V2TIM_PRIORITY_DEFAULT, // 消息优先级
          onlineUserOnly:false, // 是否只有在线用户才能收到，如果设置为 true ，接收方历史消息拉取不到，常被用于实现“对方正在输入”或群组里的非重要提示等弱提示功能，该字段不支持 AVChatRoom。
          isExcludedFromUnreadCount: true, // 发送消息是否计入会话未读数
          isExcludedFromLastMessage: true, // 发送消息是否计入会话 lastMessage
          needReadReceipt:false, // 消息是否需要已读回执（只有 Group 消息有效，6.1 及以上版本支持，需要您购买旗舰版套餐）
          offlinePushInfo: OfflinePushInfo(), // 离线推送时携带的标题和内容
          cloudCustomData: "", // 消息云端数据，消息附带的额外的数据，存云端，消息的接收者可以访问到
          localCustomData:"" // 消息本地数据，消息附带的额外的数据，存本地，消息的接收者不可以访问到，App 卸载后数据丢失
          );
      if (sendMessageRes.code == 0) {
        // 发送成功
        Remind.toast("发送成功");
      }

  }


}
