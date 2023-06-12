import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/im_add_user_controller.dart';
import "../../../../Component/IMChat.dart";

class ImAddUserView extends GetView<ImAddUserController> {
  const ImAddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(

      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(0, 218, 253, 1), Color.fromRGBO(1, 169, 253, 1),], // 渐变色数组
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            searchComponent(context),
            controller.searchStatus.value == 1? Container(
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                "当前用户不存在",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38
                ),
              ),
            ):
            Expanded(
              flex: 1,
              child: ListView(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                children: controller.searchList.map((item){
                  return userItem(item);
                }).toList().cast<Widget>(),
              ),
            )
          ],
        ),
      ),
    ));
  }


  // 搜索
  searchComponent(context){
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(left: 16,right: 16),
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child:Container(
              margin: EdgeInsets.only(right: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding:const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                  fillColor: Colors.grey[200], // 设置背景颜色为灰色
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // 去掉边框
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // 去掉聚焦时的边框
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value){
                  controller.handelSearch(value);
                },
                
              ),
            )
          ),
          InkWell(
            onTap: (){controller.submitSearch();},
            child: Container(
              width: 60,
              height: 32,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration:BoxDecoration(
                color: const Color.fromRGBO(117, 197, 243, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "搜索",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 搜索的用户
  userItem(itemInfo){
    // /im-friend-info
    return InkWell(
      onTap:(){
        Get.toNamed("/im-friend-info",arguments: {"userID":itemInfo.userID});
      },
      child: Container(
        padding:const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          border:  Border(
            bottom: BorderSide(
              color: Color.fromARGB(66, 221, 221, 221),
              width: 1
            )
          )
        ),
        child: Row(
          children: [
            Container(
              child: IMChat.IdentifyAvatars(itemInfo.faceUrl, itemInfo.userID),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Text(itemInfo.userID),
            )
          ],
        ),
      ),
    );
  }


}
