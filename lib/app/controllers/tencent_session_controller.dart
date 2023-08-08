
import 'package:flutter_im/app/controllers/tencent_message_controller.dart';
import 'package:get/get.dart';

import 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';


class TencentSessionController extends GetxController {
  /*调用消息控制器 */
  TencentMessageController tencentMessageController = Get.find();
  
  /* 会话监听器 */
  late V2TimConversationListener listener;

  /*会话列表 */
  RxList<V2TimConversation?> sessionList = <V2TimConversation>[].obs;

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
        /**如果会话项重复替换之前的会话项目，反而新增一项 */
        int index = sessionList.indexWhere((element) => element!.userID == conversationList[0].userID);
        if(index != -1){
          sessionList[index] = conversationList[0];
        }else{
          sessionList.addAll(conversationList);
        }
        /* 在消息列表中插入最新消息 */
        if(tencentMessageController.historyMessage[0].userID == conversationList[0].userID){
          tencentMessageController.historyMessage.add(conversationList[0].lastMessage as V2TimMessage);
          /*消息列表置㡳 */
          tencentMessageController.scrollToBottom();
        }
        
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

  /* 会话列表 */
  tencentSessionList()async{
    sessionList.value = <V2TimConversation>[];
    V2TimValueCallback<V2TimConversationResult> concList = 
      await TencentImSDKPlugin.v2TIMManager.getConversationManager().getConversationList(nextSeq: '0',count: 100);
      concList.data?.conversationList?.forEach((item){
        sessionList.add(item);
      });
  }





}
