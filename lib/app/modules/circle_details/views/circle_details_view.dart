import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../../../common/timeFormat.dart';
import '../../../components/circleData.dart';
import '../../../model/circleDetModel.dart';
import '../controllers/circle_details_controller.dart';

class CircleDetailsView extends GetView<CircleDetailsController> {
  const CircleDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery. of (context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  singleRowComponent(),
                  const Padding(padding: EdgeInsets.only(bottom: 40))
                ],
              )
            ),
            inputComponent()
          ],
        ),
      )
    ));
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
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
            child:  Text(
              controller.titleName.value,
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

  /* 朋友圈单条详情 */
  singleRowComponent(){
    return Container(
      child: Column(
        children: [
          /* 作者详情 */
          singleRowUserInfo(),
          /* 作者发送内容 */
          controller.circleDet.value.content!.isNotEmpty?CircleData.textComponent(context: controller.circleDet.value.content):Container(),
          controller.circleDet.value.imgUrl!.isNotEmpty?CircleData.ImageComponent(imgUrl:controller.circleDet.value.imgUrl):Container(),
          /* 评论标题 */
          singleComment(),
          /* 评论项 */
          // singleDataComponent(),
          ...List.generate(
            controller.circleCommit?.length ?? 0,
            (index)=>singleDataComponent(controller.circleCommit![index])
          )
        ],
      ),
    );
  }
  /* 朋友圈用户详情 */
  singleRowUserInfo(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("lib/assets/img/user.png"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* 异步写法 */
                      controller.circleDet.value.userId == null ?Container() : Container(
                        child: FutureBuilder<String>(
                          future: controller.handelUserInfo(controller.circleDet.value.userId),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // 如果Future正在加载中，显示一个加载动画或占位符
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // 如果Future返回错误，显示错误消息
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // 如果Future成功返回数据，显示数据
                              return Text(
                                "${snapshot.data}",
                                style: const TextStyle(
                                  color: MyTheme.stressFontColor,
                                  fontSize: 16
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   child: const Text(
                      //     "南开大学网络教育学院",
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        child:  Text(
                          TimeFormat.toText((controller.circleDet.value.time !~/ 1000),formatText:"yyyy-MM-dd H:mm"),
                          style: const TextStyle(
                            fontSize: 14,
                            color: MyTheme.unimportantFontColor
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          /* 位置 */
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: const Icon(
                    AliIcon.position,
                    color: MyTheme.unimportantFontColor,
                    size: 20,
                  ),
                ),
                Container(
                  child:const Text(
                    "天津 西青区",
                    style: TextStyle(
                      color: MyTheme.unimportantFontColor
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /* 评论标题 */
  singleComment(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      alignment: Alignment.centerLeft,
      child: const Text(
        "评论",
        style: TextStyle(
          color: MyTheme.stressFontColor,
          fontSize: 20
        ),
      ),
    );
  }

  /* 评论内容 */
  singleDataComponent(CommitList item){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
      decoration: const BoxDecoration(
        border:Border(
          bottom: BorderSide(width: 0.5,color: Color.fromARGB(255, 233, 233, 233))
        )
      ),
      child:Column(
        children: [
          /* 用户头像、名称、发表时间 */
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* 头像名称 */
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 40,
                        height: 40,
                        child:Image.asset("lib/assets/img/user.png")
                      ),
                      /* 异步写法 */
                      Container(
                        child: FutureBuilder<String>(
                          future: controller.handelUserInfo(item.userId),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // 如果Future正在加载中，显示一个加载动画或占位符
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // 如果Future返回错误，显示错误消息
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // 如果Future成功返回数据，显示数据
                              return Text(
                                "${snapshot.data}",
                                style: const TextStyle(
                                  color: MyTheme.stressFontColor,
                                  fontSize: 16
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: const Text(
                      //     "张三",
                      //     style: TextStyle(
                      //       color: MyTheme.themeColor
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                /* 发表时间 */
                Container(
                  child: Text(
                    TimeFormat.toText((item.time !~/ 1000),formatText:"yyyy-MM-dd H:mm"),
                    style:const TextStyle(
                      color: MyTheme.unimportantFontColor
                    ),
                  ),
                )

              ],
            ),
          ),

          /* 评论内容 */
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Text(
              '${item.commit}',
              style:const TextStyle(
                color: MyTheme.stressFontColor
              ),
            ),
          )

        ],
      )
    );
  }


  /* 输入框 */
  inputComponent(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
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
              child: TextField(
                controller: controller.circleInputController,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:0,horizontal:20), /*调整上下内边距,可改变输入框的高度*/
                  border: InputBorder.none,
                ) /*不显示下划线*/ 
              ),
            ),
          ),

          /* 发送 */
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
          )

          /* 表情按钮 */
          // InkWell(
          //   borderRadius: BorderRadius.circular(20),
          //   onTap: (){print("表情");},
          //   child: Container(
          //     child: const Icon(
          //       Icons.emoji_emotions,
          //       color: MyTheme.stressFontColor,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }


}
