import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/circle_send_controller.dart';

class CircleSendView extends GetView<CircleSendController> {
  const CircleSendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            sendCircleComponent(),
            sendComponent(context)
          ],
        ),
      )
    );
  }

   /* 标题模块 */
  headerComponent(){
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){Get.back();},
            child: Container(
              child: const Icon(
                Icons.arrow_back_ios,
                color: MyTheme.unimportantFontColor,
              ),
            ),
          ),
          Container(
            child: const Text(
              "发布朋友圈",
              style: TextStyle(
                color: MyTheme.stressFontColor,
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }

  /**发布内容 */
  sendCircleComponent(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
      padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          /* 评论表单 */
          Container(
            child: const TextField(
              maxLines: 10,
              maxLength: 150,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                hintText: "朋友圈内容", // 提示词
                border: OutlineInputBorder(), // 带边框
              )
            ),
          ),
          /* 上传图片 */
          Container(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color:const Color.fromARGB(255, 221, 221, 221),width: 0.5)
              ),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 221, 221, 221),
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 发布按钮 */
  sendComponent(context){
    return Container(
      width: MediaQuery. of (context).size.width,
      height: 40,
      margin: const EdgeInsets.only(left: 10,right: 10),
      child: Ink(
        decoration: BoxDecoration(
          color: MyTheme.themeColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: InkWell(
          borderRadius:BorderRadius.circular(20),
          onTap: (){},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child:const Text(
              "发布成功",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

}
