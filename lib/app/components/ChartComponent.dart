import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

class ChartComponent {
  /* 我的信息 */
  static myChart(messageInfo){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 60,bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin:const EdgeInsets.only(right: 10),
            child: Image.asset("lib/assets/img/user.png"),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              // child: Text("南开大学网络教育学院,允公允能,日新月异;欢迎来到南开大学"),
              child: Text("${messageInfo.text}"),
            )
          )
        ],
      ),
    );
  }
  /* 对方的信息 */
  static sideChart(messageInfo){
    return Container(
      margin: const EdgeInsets.only(left: 60,right: 10,bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
              decoration: const BoxDecoration(
                color: MyTheme.themeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              child: Text(
                "${messageInfo.text}",
                style:const TextStyle(color: Colors.white),
              ),
            )
          ),
          Container(
            width: 40,
            height: 40,
            margin:const EdgeInsets.only(left: 10),
            child: Image.asset("lib/assets/img/user.png"),
          ),
        ],
      ),
    );
  }
}