import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../../../components/circleData.dart';
import '../controllers/circle_details_controller.dart';

class CircleDetailsView extends GetView<CircleDetailsController> {
  const CircleDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
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
            child: const Text(
              "朋友圈",
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

  /* 朋友圈单条详情 */
  singleRowComponent(){
    return Container(
      child: Column(
        children: [
          /* 作者详情 */
          singleRowUserInfo(),
          /* 作者发送内容 */
          CircleData.textComponent(),
          CircleData.ImageComponent(),
          /* 评论标题 */
          singleComment(),
          /* 评论项 */
          singleDataComponent(),
          singleDataComponent(),
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
                      Container(
                        child: const Text(
                          "南开大学网络教育学院",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "1天前",
                          style: TextStyle(
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
  singleDataComponent(){
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
                        width: 40,
                        height: 40,
                        child:Image.asset("lib/assets/img/user.png")
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "张三",
                          style: TextStyle(
                            color: MyTheme.themeColor
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /* 发表时间 */
                Container(
                  child: Text(
                    "15:30",
                    style: TextStyle(
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
            child: const Text(
              "评论内容评论内容评论内容评论内容评论内容评论内容",
              style: TextStyle(
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
