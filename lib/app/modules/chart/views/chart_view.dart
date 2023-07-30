import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import '../controllers/chart_controller.dart';
import "../../../components/ChartComponent.dart";

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              "南开大学网络教育学院",
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

  /**聊天模块 */
  chartComponent(){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243)
      ),
      child: ListView(
        children: [
          ChartComponent.myChart(),
          ChartComponent.sideChart()
        ],
      ),
    );
  }
  /* 输入框 */
  inputComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Row(
        children: [
          /* 语音切换 */
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){},
            child: Container(
              child:const Icon(
                Icons.keyboard_voice,
                color: MyTheme.stressFontColor,
              ),
            ),
          ),
          /**输入框 */
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(31, 145, 145, 145),
                borderRadius: BorderRadius.circular(20)
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:0,horizontal:20), /*调整上下内边距,可改变输入框的高度*/
                  border: InputBorder.none,
                ) /*不显示下划线*/ 
              ),
            ),
          ),
          /* 表情按钮 */
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){print("表情");},
            child: Container(
              child: const Icon(
                Icons.emoji_emotions,
                color: MyTheme.stressFontColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
