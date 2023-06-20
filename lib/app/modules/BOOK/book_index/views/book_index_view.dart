import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_friend_info.dart';
import 'package:tencent_mi_flutter/app/Component/IMChat.dart';

import '../controllers/book_index_controller.dart';

class BookIndexView extends GetView<BookIndexController> {
  const BookIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation:0,
        title:Text(controller.titleName.value),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 218, 253, 1), 
              Color.fromRGBO(1, 169, 253, 1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
      body:Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){Get.toNamed("/book-new-people");},
              child: Container(
                height: 52,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1
                    )
                  )
                ),
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "新朋友",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.navigate_next_rounded,size: 23)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: controller.globalController.friendList!.map((item){
                  return contactsItemComponent(item);
                }).toList().cast<Widget>(),
                // children: [
                //   contactsItemComponent()
                // ],
              )
            )
          ],
        ),
      ),
    ));
  }

  contactsItemComponent(V2TimFriendInfo  friendInfo){
    return InkWell(
      onTap:(){print("建立会话");},
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 16),
        decoration:const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromARGB(255, 235, 234, 234)), // 设置下边框
          ),
        ),
        child:Row(
          children: [
            IMChat.IdentifyAvatars(friendInfo.userProfile?.faceUrl,friendInfo.userID),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                friendInfo.userID,
                style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
