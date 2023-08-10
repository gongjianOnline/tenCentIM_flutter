import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/AliIcon.dart';
import '../../../common/myTheme.dart';
import '../../../common/timeFormat.dart';
import '../../../components/circleData.dart';
import '../../../model/circleListModel.dart';
import '../controllers/circle_controller.dart';

class CircleView extends GetView<CircleController> {
  const CircleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        child: Column(
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: ListView(
                children:controller.circleListController.circleList.map((item){
                  return baseCircleComponent(item);
                }).toList().cast<Widget>(),
                // children: [
                //   baseCircleComponent(),
                //   baseCircleComponent(),
                //   baseCircleComponent(),
                //   baseCircleComponent(),
                //   // const Padding(padding:EdgeInsets.only(top: 50))
                // ],
              )
            )
          ],
        ),
      )
    ));
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 1,top: 1),
            decoration: BoxDecoration(
              color:MyTheme.themeColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Text(
              controller.titleName.value,
              style:const TextStyle(color: Colors.white)
            ),
          ),
          Material(
            child: InkWell(
              onTap: (){
                Get.toNamed("/circleSend");
              },
              child:Container(
                child: const Icon(
                  AliIcon.edit,
                  color: MyTheme.themeColor,
                  size: 22,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 基本信息，包含用户信息，位置，点赞数，评论 */
  baseCircleComponent(CircleListData itemData){
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
                            /* 异步写法 */
                            Container(
                              child: FutureBuilder<String>(
                                future: controller.handelUserInfo(itemData.userId),
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
                            /* 同步写法 */
                            // Container(
                            //   child:Text(
                            //     "${controller.handelUserInfo(itemData.userId)}",
                            //     style: const TextStyle(
                            //       color: MyTheme.stressFontColor,
                            //       fontSize: 16
                            //     ),
                            //   ),
                            // ),
                            /* 时间戳 */
                            Container(
                              child: Text(
                                TimeFormat.toText((itemData.time~/1000),formatText:"yyyy-MM-dd H:m"),
                                // "${itemData.time}",
                                style: const TextStyle(
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
                  onTap: (){Get.toNamed("/circleDetails");},
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
          CircleData.textComponent(context:itemData.content),
            /* 图片 */
          itemData.imgUrl.isNotEmpty?CircleData.ImageComponent(imgUrl:itemData.imgUrl):Container(),

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
                          AliIcon.position,
                          color: MyTheme.themeColor,
                          size: 16,
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
                            AliIcon.like,
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
                            AliIcon.comment,
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
