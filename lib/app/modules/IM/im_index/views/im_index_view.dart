import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kumi_popup_window/kumi_popup_window.dart';


import '../controllers/im_index_controller.dart';

class ImIndexView extends GetView<ImIndexController> {
  ImIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation:0,
        title:headerComponent(context),
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
              // headerComponent(context),
              Expanded(
                flex: 1,
                child: ListView(
                  // padding:const EdgeInsets.only(left: 16,right: 16),
                  children: [
                    messageListComponent("","火蓝"),
                    messageListComponent("","admin"),
                  ],
                )
              )

            ],
          ),
        )
    ));
  }


  // 头部模块
  headerComponent(content){
    return Container(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Get.toNamed("/im-user-info");
            },
            child: Container(
              child: Row(
                children: [
                  IdentifyAvatars("",controller.userName.value),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10.5),
                          child: Text(
                            "${controller.userName}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight:FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){print("搜索");},
                    child: const Icon(
                      Icons.manage_search,
                      size: 28,
                    ),
                  )
                ),
                InkWell(
                  onTap: (){
                    popComponent(content);
                  },
                  child: Container(
                    child: const Icon(
                      Icons.add,
                      size: 28,
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }



  // 消息列表模版
  messageListComponent(url,userName){
    return InkWell(
        onTap:(){
          Get.toNamed("/im-talk");
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10,bottom: 10),
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Row(
            children: [
              IdentifyAvatars(url,userName),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child:Text(
                                userName,
                                style: const TextStyle(
                                  color: Color.fromRGBO(8, 27, 34, 1),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Container(
                              child: const Text(
                                "08:53",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 143, 146, 1),
                                  fontSize: 14
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: const Text(
                                  "[未读] 你收到一条新消息!",
                                  style: TextStyle(
                                    color: Color.fromRGBO(143, 143, 146, 1),
                                    fontSize: 14
                                  ),
                                ),
                              )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 4,right: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(240,72,64,1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "99+",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white
                                ),
                              ),
                            )
                            
                          ],
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
    );
  }

  // 识别头像
  IdentifyAvatars(String? url,String userName ){
    if(url == "" || url == null){
      /**如果用户没有设置头像,取名字的最后两个字符 */
      int userNameLength = userName.length;
      String lastName = "";
      if(userNameLength <= 2){
        lastName = userName;
      }
      if(userNameLength >= 3){
        lastName = userName.substring(userName.length - 2);
      }
      return Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(1, 104, 253, 1),Color.fromRGBO(2, 161, 255, 1)]
          )
        ),
        child:Text(
          lastName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14
          ),
        ),
      );
    }else{
      return Container(
        width: 38,
        height: 38,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child:Image.asset("assets/images/3.0x/$url.png")
      );
    }
    
  }

  // 下拉框
  popComponent(context){
    showPopupWindow(
      context,
      gravity: KumiPopupGravity.rightTop,
      bgColor: Colors.transparent,
      clickOutDismiss: true,
      clickBackDismiss: true,
      customAnimation: false,
      customPop: false,
      customPage: false,
      underStatusBar: false,
      underAppBar: true,
      offsetX: 10,
      offsetY: -10,
      duration: const Duration(milliseconds: 200),
      childFun: (pop) {
        return Container(
          padding: const EdgeInsets.only(top:11),
          width: 97,
          height: 150,
          key: GlobalKey(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: (){Get.offNamed("/im-add-user");},
                child: Container(
                  padding: const EdgeInsets.only(bottom: 11),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(225, 227, 229, 1),// 设置下边框颜色为红色
                        width: 1, // 设置下边框宽度为 2
                        style: BorderStyle.solid, // 设置下边框样式为实线
                      ),
                    ),
                  ),
                  child: const Text(
                    "添加好友",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
