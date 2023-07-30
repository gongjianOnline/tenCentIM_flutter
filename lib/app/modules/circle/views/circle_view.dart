import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
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
                  baseCircleComponent()
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
      padding: const EdgeInsets.only(left: 10,right: 10),
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
                              child: Text("南开大学网络教育学院"),
                            ),
                            Container(
                              child: Text("1分钟前"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                /* 详情 */
                Container(
                  child: const Icon(Icons.more_horiz_sharp),
                )


              ],
            ),
          )
        
        
        ],
      ),
    );
  }
}
