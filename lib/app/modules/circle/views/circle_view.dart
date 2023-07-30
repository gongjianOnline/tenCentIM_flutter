import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../../../components/circleData.dart';
import '../controllers/circle_controller.dart';

class CircleView extends GetView<CircleController> {
  const CircleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  baseCircleComponent(),
                  baseCircleComponent(),
                  baseCircleComponent(),
                  baseCircleComponent(),
                  const Padding(padding:EdgeInsets.only(top: 50))
                ],
              )
            )
          ],
        ),
      )
    );
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 1,top: 1),
            decoration: BoxDecoration(
              color:MyTheme.themeColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: const Text("好友",style: TextStyle(color: Colors.white),),
          ),
          Material(
            child: InkWell(
              onTap: (){
                Get.toNamed("/addFriend");
              },
              child:Container(
                child: const Icon(
                  Icons.edit_note,
                  color: MyTheme.themeColor,
                  size: 26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 基本信息，包含用户信息，位置，点赞数，评论 */
  baseCircleComponent(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
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
          /* 基本信息 */
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* 头像、用户名、发布时间 */
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset("lib/assets/img/user.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child:const Text(
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
                                  fontSize: 12
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                /* 详情 */
                InkWell(
                  onTap: (){},
                  child: Container(
                    child: const Icon(
                      Icons.more_horiz_sharp,
                      color: MyTheme.unimportantFontColor,
                    ),
                  ),
                )
              ],
            ),
          ),

          /* 朋友圈内容 */
          CircleData.textComponent(),
            /* 图片 */
          CircleData.ImageComponent(),

          /* 操作模块 */
          Container(
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
                        onTap: (){},
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
          )

        
        ],
      ),
    );
  }
}
