import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Component/IMChat.dart';
import '../controllers/im_friend_info_controller.dart';

class ImFriendInfoView extends GetView<ImFriendInfoController> {
  const ImFriendInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        backgroundColor:const Color.fromRGBO(245, 245, 245, 1),
        body: Column(
          children: [
            // banner 和 用户信息
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: [
                  // banner背景
                  bannerComponent(context),
                  // 返回按钮
                  backComponent(context),
                  // 用户头像和附带信息
                  userComponent()
                ],
              )
            ),

            // 个人信息模块
            Container(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 28),
              margin: const EdgeInsets.only(left: 16,right: 16,top: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  userInfo("性别",controller.userFullInfo?.gender==1?"男":"女"),
                  userInfo("生日","${controller.userFullInfo?.birthday}"),
                  userInfo("昵称","${controller.userFullInfo?.nickName}"),
                  userInfo("个性签名","${controller.userFullInfo?.selfSignature}"),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 16,right: 16),
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blue[600]
                      ),
                      onPressed: (){},
                      child: Text(controller.titleName.value),
                    ),
                  )
                ],
              ),
            )

          ],
        )
    ));
  }


  // banner背景
  bannerComponent(context){
    return  Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        // child: Image.asset(
        //   "assets/images/3.0x/IMUserHeader.png",
        //   fit: BoxFit.cover,
        // ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 218, 253, 1), 
            Color.fromRGBO(1, 169, 253, 1),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ),
    );
  }
  // 返回按钮
  backComponent(context){
    return Positioned(
      left: 16,
      top: (MediaQuery.of(context).padding.top)+8,
      child: InkWell(
        onTap: (){Get.back();},
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  // 用户头像及组织信息
  userComponent(){
    return Positioned(
      left: 0,
      right: 0,
      child:Transform.translate(
        offset: Offset(0, 110),
        child:Center(
          child:Column(
            // 头像
            children: [
              Container(
                width: 120,
                height: 120,
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(120)
                ),
                child: IMChat.IdentifyAvatars(controller.userFullInfo?.faceUrl as String,controller.userFullInfo?.userID as String),
              ),
              // 用户名和性别
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Text(
                        controller.userFullInfo?.userID as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.w500 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ), 
      ) 
    );
  }

  // 个人信息
  userInfo(label,String value){
    return Container(
      padding: const EdgeInsets.only(bottom:14,top: 28),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            width: 1.0
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),
          ),
          Text(
            value == 'null'?"暂无":value,
            style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }

}

