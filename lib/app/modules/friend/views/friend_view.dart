import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';
import 'package:badges/badges.dart' as badges;

import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';

import '../../../common/AliIcon.dart';
import '../controllers/friend_controller.dart';

class FriendView extends GetView<FriendController> {
  const FriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          // color: MyTheme.bgColor
        ),
        child: Column(
          children: [
            headerComponent(),
            searchComponent(),
            Expanded(
              flex: 1,
              child: friendListComponent()
            )
          ],
        )
      )
    ));
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
            child: Text(controller.titleName.value,style: const TextStyle(color: Colors.white),),
          ),
          Material(
            child:badges.Badge(
              badgeContent: Text(
                "${controller.tencentRelationshipController.friendApplyList.length}",
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
              showBadge: controller.tencentRelationshipController.friendApplyList.isEmpty?false:true,
              position: badges.BadgePosition.topEnd(end: -4),
              badgeStyle:const badges.BadgeStyle(
                badgeColor: Color.fromRGBO(229, 115, 115, 1)
              ),
              child: InkWell(
                onTap: (){
                  Get.toNamed("/addFriend");
                },
                child:Container(
                  child: const Icon(
                    AliIcon.addFriends,
                    color: MyTheme.themeColor,
                    size: 26,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 搜索模块 */
  searchComponent(){
    return  Container(
      height:32,
      margin: const EdgeInsets.only(top: 14,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const TextField(
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "搜索",
          hintStyle:TextStyle(color:Color.fromRGBO(206, 206, 206, 1)),
          contentPadding: EdgeInsets.symmetric(vertical:9,horizontal:-10), // 调整上下内边距
          border: InputBorder.none,
          icon:Padding(
            padding:  EdgeInsets.only(left: 10,),
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(228, 228, 228, 1),
            ),
          )
        ),
      ),
    );
  }

  /*好友列表 */
  friendListComponent(){
    return ListView(
      children: controller.tencentRelationshipController.friendList.map((item){
        return  friendItem(item!);
      }).toList().cast<Widget>(),
    );
  }

  /* 好友信息 */
  friendItem(V2TimFriendInfo friendInfo){
    return InkWell(
      onTap: (){Get.toNamed("/chart");},
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset("lib/assets/img/user.png"),
            ),
            Expanded(
              flex: 1,
              child:Container(
                height: 52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        (friendInfo.userProfile?.nickName == null || friendInfo.userProfile?.nickName =="")?friendInfo.userID:friendInfo.userProfile?.nickName as String,
                        style:const TextStyle(
                          fontSize: 16,
                          color: MyTheme.stressFontColor
                        ),
                      )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "天津 西青区",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyTheme.unimportantFontColor
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}
