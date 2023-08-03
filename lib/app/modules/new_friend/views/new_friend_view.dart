import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/new_friend_controller.dart';

class NewFriendView extends GetView<NewFriendController> {
  const NewFriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: ListView(
                padding:const EdgeInsets.only(top: 0),
                children: [
                  searchResult()
                ],
              )
            )
          ],
        ),
      ),
    ));
  }

  /* 标题模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: MyTheme.unimportantFontColor,
            ),
          ),
          Text(
            controller.titleName.value,
            style:const TextStyle(
              fontSize: 28,
              color: MyTheme.stressFontColor
            ),
          ),
        ],
      )
    );
  }

  /* 好友请求列表 */
  searchResult(){
    return Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        margin: const EdgeInsets.only(bottom: 20,top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* 头像，用户名，ID */
            Container(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("lib/assets/img/user.png"),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 50,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "南开大学网络教育学院",
                            style: TextStyle(
                              fontSize: 16,
                              color: MyTheme.stressFontColor
                            ),
                          ),
                        ),
                        Container(
                          child: const Text(
                            "ID: admin",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyTheme.unimportantFontColor
                            ),
                          ),
                        ),

                      ],
                    ),
                  )


                ],
              ),
            ),

            /* 按钮组 */
            Container(
              child: Row(
                children: [
                  InkWell(
                    borderRadius:BorderRadius.circular(10),
                    onTap: (){print("拒绝");},
                    child: Container(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 4,top: 4),
                      // margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Text(
                        "拒绝",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                  /* 分割空隙 */
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  InkWell(
                    borderRadius:BorderRadius.circular(10),
                    onTap: (){print("同意");},
                    child: Container(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 4,top: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Text(
                        "同意",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
    );
  }

}