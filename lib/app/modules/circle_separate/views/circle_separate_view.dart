import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';
import 'package:flutter_im/app/components/circleData.dart';

import 'package:get/get.dart';

import '../controllers/circle_separate_controller.dart';

class CircleSeparateView extends GetView<CircleSeparateController> {
  const CircleSeparateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: controller.isHeader.value ? simpleComponent() : Container(),
            ),
            // controller.isHeader.value?simpleComponent():Container(),
            Expanded(
              flex: 1,
              child: ListView(
                controller: controller.listViewController,
                padding: const EdgeInsets.only(top: 0,bottom: 40),
                children: [
                  detailsComponent(),
                  trendsComponent(),
                  trendsComponent(),
                ],
              )
            )
          ],
        ),
      ),
    ));
  }

  /* 简要标题 */
  simpleComponent(){
    return Stack(
      children: [
        Container(
          decoration:const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: const Color.fromARGB(255, 214, 214, 214),width: 0.5)
            )
          ),
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.arrow_back_ios,color:MyTheme.unimportantFontColor),
              ),
              Container(
                child:const Text("南开大学网络教育学院",style: TextStyle(color: MyTheme.stressFontColor,fontSize: 18),),
              )
            ],
          ),
        )
      ],
    );
  }

  /*详细布局 */
  detailsComponent(){
    return  Container(
      decoration: BoxDecoration(color: MyTheme.themeColor),
      padding: const EdgeInsets.only(left: 10,right: 10),
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    controller.titleName.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: const Text(
                    "允公允能 日新月异",
                    style: TextStyle(
                      color:const Color.fromRGBO(51,255,204, 1),
                      fontSize: 16
                    ),
                  ),
                )
              ],
            ),
          ),
          /* 头像 */
          Container(
            width: 60,
            height: 60,
            child: Image.asset("lib/assets/img/user.png"),
          )
        ],
      )
    );
  }

  /*  动态信息 */
  trendsComponent(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0), //阴影xy轴偏移量
            blurRadius: 4.0, //阴影模糊程度
            spreadRadius:1.0 //阴影扩散程度
          )
        ]
      ),
      child: Column(
        children: [
          /* 用户头像 名称 发表时间 */
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  child: Image.asset("lib/assets/img/user.png"),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          "南开大学网络教育学院",
                          style: TextStyle(
                            color: MyTheme.stressFontColor,
                            fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "1分钟前",
                          style: TextStyle(
                            color: MyTheme.unimportantFontColor,
                            fontSize: 13
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          /* 动态信息内容 */
          CircleData.textComponent(),
          CircleData.ImageComponent(),

          /* 操作按钮 */
          trendsOperateComponent()

        ],
      ),
    );
  }

  /* 动态信息操作栏 */
  trendsOperateComponent(){
    return Container(
      margin: const EdgeInsets.only(left:10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* 位置 */
          Container(
            child: Row(
              children: [
                Container(
                  child: const Icon(
                    Icons.fmd_good,
                    color: MyTheme.themeColor,
                    size: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: const Text(
                    "天津西青区",
                    style: TextStyle(
                      fontSize: 12,
                      color: MyTheme.themeColor
                    ),
                  ),
                )
              ],
            ),
          ),
          
          /* 点赞 收藏 */
          Container(
            child: Row(
              children: [
                /* 点赞 */
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.only(right: 14),
                    child: const Icon(
                      Icons.tag_faces,
                      size: 20,
                      color: MyTheme.unimportantFontColor,
                    ),
                  ),
                ),
                /* 评论 */
                InkWell(
                  onTap: (){Get.toNamed("/circleDetails");},
                  child: Container(
                    child: const Icon(
                      Icons.message,
                      size: 20,
                      color: MyTheme.unimportantFontColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}
