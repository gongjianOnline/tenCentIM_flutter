import 'package:flutter_im/app/common/remind.dart';
import 'package:get/get.dart';

import '../api/circleApi.dart';
import "../model/circleListModel.dart";


/* 朋友圈数据控制器 */
class CircleListController extends GetxController {
  
  /* 朋友圈列表 */
  RxList<CircleListData> circleList = <CircleListData>[].obs;


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

  /* 拉取朋友圈列表 */
  handelCircleList(userId)async{
    var response = await CircleApi.getList({"userId":userId});
    CircleList initResponse = CircleList.fromJson(response);
    if(initResponse.code == 101){
      for(var i=0;i<initResponse.data!.length;i++){  
        circleList.add(initResponse.data![i]);
      }
    }else{
      Remind.toast("网络开小差~");
    }
  }

}
