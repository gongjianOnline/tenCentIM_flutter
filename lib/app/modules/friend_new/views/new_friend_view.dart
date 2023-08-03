import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_application.dart';

import '../../../common/myTheme.dart';
import '../../../controllers/tencent_relationship_controller.dart';
import '../controllers/new_friend_controller.dart';

class NewFriendView extends GetView<NewFriendController> {
  /* 调用好友关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();
  NewFriendView({Key? key}) : super(key: key);
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
                padding:const EdgeInsets.only(top: 10),
                children:tencentRelationshipController.friendApplyList.map((element) {
                  return searchResult(element);
                }).toList().cast<Widget>(),
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
  searchResult(V2TimFriendApplication friendApplyItem){
    return Container(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 0.5
            )
          )
        ),
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
                          child: Text(
                            "${(friendApplyItem.userID ==""||friendApplyItem.nickname==null)?friendApplyItem.userID:friendApplyItem.nickname}",
                            style:const TextStyle(
                              fontSize: 16,
                              color: MyTheme.stressFontColor
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "ID: ${friendApplyItem.userID}",
                            style:const TextStyle(
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
