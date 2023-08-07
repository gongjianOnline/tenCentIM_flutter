import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimAdvancedMsgListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_priority_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/offlinePushInfo.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_receipt.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_msg_create_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

import '../common/remind.dart';
  
  /* 消息监听器 */
class TencentMessageController extends GetxController {
  /* 消息配置变量 */
  late V2TimAdvancedMsgListener listener;
  
  @override
  void onInit() {
    super.onInit();
    tencentInitMessage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 消息监听器 */
  configMessage(){
    listener = V2TimAdvancedMsgListener(
      onRecvC2CReadReceipt: (List<V2TimMessageReceipt> receiptList) {
        //单聊已读回调
        print("单聊已读回调");
      },
      onRecvMessageModified: (V2TimMessage message) {
        // msg 为被修改之后的消息对象
        print("message修改之后的消息对象");
      },
      onRecvNewMessage: (V2TimMessage message) async {
        // 处理文本消息
        if (message.elemType == MessageElemType.V2TIM_ELEM_TYPE_TEXT) {
          print("处理文本消息 ${message.textElem?.text}");
          // message.textElem?.text;
        }
      },
    );
  }

  /* 初始化消息监听器 */
  tencentInitMessage(){
    configMessage();
    TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .addAdvancedMsgListener(listener: listener);
  }




  /* 单聊文本消息 */
  tencentTextMessage(String text,String userID)async{
    V2TimValueCallback<V2TimMsgCreateInfoResult> createTextMessageRes =
      await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .createTextMessage(
          text: text, // 文本信息
        );
        print("创建的会话ID ${createTextMessageRes.data?.id}");
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
        isExcludedFromUnreadCount: false, // 发送消息是否计入会话未读数
        isExcludedFromLastMessage: false, // 发送消息是否计入会话 lastMessage
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
