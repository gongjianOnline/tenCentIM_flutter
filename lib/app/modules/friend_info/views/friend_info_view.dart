import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import '../controllers/friend_info_controller.dart';

class FriendInfoView extends GetView<FriendInfoController> {
  const FriendInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            userInfoComponent(context),
            positionComponent(),
            addFriendComponent(context)
          ],
        ),
      )
    ));
  }

  /* 用户信息 */
  userInfoComponent(context){
    return  Container(
      padding: const EdgeInsets.only(top: 26,bottom: 26),
      width: MediaQuery. of (context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            width:60,
            height: 60,
            child: Image.asset("lib/assets/img/user.png"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            child: Text(
              controller.friendObj.value.nickName == ""?controller.friendObj.value.userID:controller.friendObj.value.nickName,
              style: const TextStyle(
                fontSize: 16,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              "ID: ${controller.friendObj.value.userID == ""?"":(controller.friendObj.value.userID).substring(0,8)}",
              style:const TextStyle(
                fontSize: 14,
                color: MyTheme.unimportantFontColor
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16,left: 20,right: 20,bottom: 14),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Color.fromARGB(103, 161, 161, 161)
                )
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              controller.friendObj.value.selfSignature == ""?"快来找我聊天吧~":controller.friendObj.value.selfSignature,
              style: const TextStyle(
                color: MyTheme.unimportantFontColor
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 位置和朋友圈 */
  positionComponent(){
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.fmd_good,
                      color: MyTheme.unimportantFontColor,
                      size: 32,
                    ),
                  ),
                  Container(
                    child: const Text(
                      "天津·西青区",
                      style: TextStyle(color: MyTheme.unimportantFontColor),
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){Get.toNamed("/circleSeparate");},
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Icon(
                        Icons.camera_alt,
                        color: MyTheme.unimportantFontColor,
                        size: 32,
                      ),
                    ),
                    Container(
                      child: const Text(
                        "圈子",
                        style: TextStyle(color: MyTheme.unimportantFontColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  /* 添加好友 */
  /*判断对方是否可以添加好友, 判断对方是否是好友 */
  addFriendComponent(context){
    return controller.friendObj.value.allowType == 2?Container(
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10)
        ),
        width: MediaQuery. of (context).size.width,
        height: 40,
        alignment: Alignment.center,
        child:const Text(
          "该用户禁止添加好友",
          style: TextStyle(
            color:Colors.white
          ),
        ),
      )
      : controller.friendObj.value.relation == 3? 
        Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: (){Get.offAndToNamed("/chart");},
            child: Container(
              width: MediaQuery. of (context).size.width,
              height: 40,
              alignment: Alignment.center,
              child:const Text(
                "发起会话",
                style:TextStyle(
                  color:MyTheme.themeColor
                ),
              ),
            ),
          ),
        ):
        Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){controller.handleAddFriend();},
          child: Container(
            width: MediaQuery. of (context).size.width,
            height: 40,
            alignment: Alignment.center,
            child:Text(
              controller.titleName.value,
              style:const TextStyle(
                color:MyTheme.themeColor
              ),
            ),
          ),
        ),
      );
    }

}
