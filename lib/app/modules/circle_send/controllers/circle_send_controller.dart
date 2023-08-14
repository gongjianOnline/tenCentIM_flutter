

import 'package:flutter_im/app/api/circleApi.dart';
import 'package:flutter_im/app/common/remind.dart';
import 'package:flutter_im/app/common/storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';


import '../../../controllers/circle_list_controller.dart';
import '../../../model/circleSendModel.dart';

class CircleSendController extends GetxController {

  /* 调用朋友圈模块 */
  CircleListController circleListController = Get.find();

  /* 创建视图层和控制器关联 */
  RxString titleName = "发送朋友圈".obs;

  /* 朋友圈表单变量 */
  RxString circleContent = "".obs;

  /* 打开相册 */
  final ImagePicker picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 朋友圈表单监听 */
  handelCircle(val){
    circleContent.value = val;
  }

  /* 发送朋友圈 */
  handelSend()async{
    /* 获取腾讯用户ID */
    var tcUserID = await Storage.getData("tcUserID");
    /* 获取系统时间 */
    DateTime date = DateTime.now();
    print(date.millisecondsSinceEpoch);
    /* 初始化参数 */
    var initData = {
      "content":circleContent.value,
      "time":date.millisecondsSinceEpoch,
      "imgUrl":"",
      "userId":tcUserID,
      "circleId":"$tcUserID-${date.millisecondsSinceEpoch}"
    };
    var response = await  CircleApi.send(initData);
    CircleSend initResponse =  CircleSend.fromJson(response);
    if(initResponse.code == 101){
      Remind.toast("发布成功");
      String tcUserID = await Storage.getData("tcUserID");
      circleListController.handelCircleList(tcUserID);
      Get.offAndToNamed("/layout");
    }else{
      Remind.toast("发布失败");
    }
  }

  /* 上传图片 */
  handelPicker()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image!.path);
  }



}
