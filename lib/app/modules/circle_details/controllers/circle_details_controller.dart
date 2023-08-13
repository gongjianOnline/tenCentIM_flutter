import 'package:flutter/cupertino.dart';
import 'package:flutter_im/app/api/circleApi.dart';
import 'package:flutter_im/app/common/remind.dart';
import 'package:flutter_im/app/common/storage.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info_result.dart';

import '../../../controllers/tencent_relationship_controller.dart';
import '../../../model/circleDetModel.dart';

class CircleDetailsController extends GetxController {
  /* 调用腾讯云用户模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();

  /* 建立视图层和控制器关联 */
  RxString titleName = "朋友圈".obs;

  /* 输入框控制器 */
  TextEditingController circleInputController = TextEditingController();
  

  /* 路由参数 */
  RxString circleId = "".obs;

  /* 朋友圈 */
  Rx<CircleInfo> circleDet = CircleInfo().obs;
  RxList<CommitList>? circleCommit = <CommitList>[].obs;


  @override
  void onInit() {
    super.onInit();
    circleId.value = Get.arguments["circleId"];
    /* 表单监听器 */
    // circleInputController.addListener((){
    //   chartInputIndex.value = circleInputController.text.length;
    // });
    handelCircleInfo();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 获取朋友圈详情 */
  handelCircleInfo()async{
    var response = await CircleApi.getDetails({"circleId":circleId.value});
    CircleDet iniResponse = CircleDet.fromJson(response);
    circleDet.value = iniResponse.data.circleInfo;
    circleCommit!.value = iniResponse.data.commitList??[];
  }  

   /* 获取用户信息 */
  Future<String> handelUserInfo(friedId)async{
    List<V2TimFriendInfoResult> result = await tencentRelationshipController.tencentGetFriendInfo(friedId);
    return result[0].friendInfo?.userProfile?.nickName as String;
  }

  /* 发送信息 */
  handelSend()async{
    if(circleInputController.text == ""){
      Remind.toast("评论内容不能为空");
      return;
    }

    DateTime date = DateTime.now();
    var tcUserId = await Storage.getData("tcUserID");
    var response = await CircleApi.sendCommit({
      "circleId":circleDet.value.circleId,
      "commit":circleInputController.text,
      "time":date.millisecondsSinceEpoch,
      "userId":tcUserId
    });
    if(response['code'] == 101){
      Remind.toast("评论成功");
      circleInputController.text = "";
      /* 拉取更新的详情 */
      handelCircleInfo();
    }else{
      Remind.toast("评论失败");
    }
  }

}
