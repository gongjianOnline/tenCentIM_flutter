import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_index_controller.dart';
import "../../../../Component/IMChat.dart";

class MyIndexView extends GetView<MyIndexController> {
  const MyIndexView({Key? key}) : super(key: key);
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
            // 操作栏
            Container(
              padding:const EdgeInsets.only(left: 32,right: 32,top: 20,bottom: 18),
              margin: const EdgeInsets.only(left: 16,right: 16,top: 37),
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child:operateComponent() 
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
                  userInfo("性别","男"),
                  userInfo("地址","河北省廊坊市"),
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
                        backgroundColor: Colors.red[400]
                      ),
                      onPressed: (){
                        Get.offNamed("/login");
                      },
                      child: Text("退出账号"),
                    )
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
                child: IMChat.IdentifyAvatars("","火蓝"),
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
                        "${controller.testName.value}",
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

  // 操作模块
  operateComponent(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: (){print("发消息");},
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Icon(Icons.message),
                ),
                Container(
                  child: const Text(
                    "发消息",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){print("加好友");},
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Icon(Icons.add),
                ),
                Container(
                  child: const Text(
                    "加好友",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  // 个人信息
  userInfo(label,value){
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
            value,
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

