import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/add_friend_controller.dart';

class AddFriendView extends GetView<AddFriendController> {
  const AddFriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            searchComponent(),
            rowComponent(),
            searchResult(),
          ],
        ),
      )
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

  /* 搜索框 */
  searchComponent(){
    return  Container(
      height:32,
      margin: const EdgeInsets.only(top: 14,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        maxLines: 1,
        decoration:const InputDecoration(
          hintText: "搜索用户ID",
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
        onChanged:(val){
          controller.handelSearch(val);
        },
      ),
    );
  }

  /* 搜索结果 */
  searchResult(){
    return controller.friendObj.value.userID == ""? Container():
      InkWell(
        onTap: (){
          if(controller.selfID.value == controller.friendObj.value.userID){
            Get.offAndToNamed("/layout");
          }else{
            Get.toNamed("/friendInfo",arguments:{"friendId":controller.friendObj.value.userID});
          }
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          margin: const EdgeInsets.only(bottom: 20,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child:Container(
                  width: 52,
                  height: 52,
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: (controller.friendObj.value.faceUrl == "")?
                      Image.asset("lib/assets/img/user.png"):Image.network(controller.friendObj.value.faceUrl,fit: BoxFit.cover,),
                ),
              ),
              Expanded(
                flex: 1,
                child:Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 52,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child:Text(
                          controller.friendObj.value.nickName == ""?controller.friendObj.value.userID:controller.friendObj.value.nickName,
                          style: const TextStyle(
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

  /* 新朋友 */
  rowComponent(){
    return InkWell(
      onTap:(){Get.toNamed("/newFriend");},
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
        decoration:const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color.fromRGBO(218, 218, 218, 1),width: 0.5)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child:badges.Badge(
                badgeContent: Text(
                  "${controller.tencentRelationshipController.friendApplyList.length}",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                showBadge: controller.tencentRelationshipController.friendApplyList.isEmpty?false:true,
                position: badges.BadgePosition.topEnd(top:-4,end: -20),
                badgeStyle:const badges.BadgeStyle(
                  badgeColor: Color.fromRGBO(229, 115, 115, 1)
                ),
                child: const Text(
                  "新朋友",
                  style: TextStyle(
                    color: MyTheme.stressFontColor,
                    fontSize: 20
                  ),
                ),
              )
            ),
            Container(
              child: const Icon(
                Icons.navigate_next_rounded,
                color: MyTheme.stressFontColor,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }

} 
