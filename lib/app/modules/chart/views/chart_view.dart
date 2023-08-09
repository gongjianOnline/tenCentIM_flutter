

import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_text_elem.dart';

import '../controllers/chart_controller.dart';
import "../../../components/ChartComponent.dart";

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              headerComponent(),
              Expanded(
                flex: 1,
                child: chartComponent()
              ),
              inputComponent()
            ],
          ),
        ),
      )
    ));
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
          Text(controller.titleName.value),
          Container(
            child:Text(
              (controller.friendInfo.value.nickName=="")?controller.friendInfo.value.userID:controller.friendInfo.value.nickName,
              style: const TextStyle(
                color: MyTheme.stressFontColor,
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }

  /**聊天模块 */
  chartComponent(){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243)
      ),
      child:RefreshIndicator(
        onRefresh:()async{
          controller.handelMoreMessage();
        },
        child: ListView(
          key: const Key("111"),
          controller: controller.tencentMessageController.scrollController,
          children: controller.tencentMessageController.historyMessage.map((item){
            if(item.isSelf as bool){
              return ChartComponent.sideChart(item.textElem as V2TimTextElem);
            }else{
              return ChartComponent.myChart(item.textElem as V2TimTextElem);
            }
          }).toList().cast<Widget>(),
          // children: [
          //   ChartComponent.myChart(),
          //   ChartComponent.sideChart()
          // ],
        ),
      )
        
    );
  }
  
  /* 输入框 */
  inputComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Row(
        children: [
          /* 语音切换 */
          // InkWell(
          //   borderRadius: BorderRadius.circular(20),
          //   onTap: (){},
          //   child: Container(
          //     child:const Icon(
          //       Icons.keyboard_voice,
          //       color: MyTheme.stressFontColor,
          //     ),
          //   ),
          // ),
          /**输入框 */
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(31, 145, 145, 145),
                borderRadius: BorderRadius.circular(20)
              ),
              child:  TextField(
                controller: controller.chartInputController,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:0,horizontal:20), /*调整上下内边距,可改变输入框的高度*/
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          /* 发送按钮 */
          controller.chartInputIndex.value==0?Container():
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (){controller.handelSend();},
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                decoration: BoxDecoration(
                  color: MyTheme.themeColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:const Text(
                  "发送",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
