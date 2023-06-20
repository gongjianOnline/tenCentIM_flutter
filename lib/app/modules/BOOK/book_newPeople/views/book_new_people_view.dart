import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tencent_mi_flutter/app/Component/IMChat.dart';
import 'package:tencent_mi_flutter/app/common/global_controller.dart';

import '../controllers/book_new_people_controller.dart';

class BookNewPeopleView extends GetView<BookNewPeopleController> {
  const BookNewPeopleView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation:0,
        title:headerComponent(),
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
      body: Container(
        child: ListView(
          children: controller.globalController.addFriendList.map((item){
            return messageListComponent(item);
          }).toList().cast<Widget>(),
          // children: [
          //   messageListComponent("","新盆友")
          // ],
        ),
      ),
    ));
  }

  // 头部模块
  headerComponent(){
    return Container(
      height: 44,
      child: Row(
        children: [
          Container(
            child: Text(
              "${controller.titleName.value}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 新好友列表
  messageListComponent(userInfo){
    return Container(
          margin: const EdgeInsets.only(top: 10,bottom: 10),
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black12,
                width: 1
              )
            )
          ),
          child: Row(
            children: [
              IMChat.IdentifyAvatars(userInfo.faceUrl,userInfo.userID),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        userInfo.userID,
                        style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6,left: 20),
                      child: const Text(
                        "请求添加为好友",
                        style: TextStyle(
                          color:Colors.black38
                        ),
                      ),
                    )
                    
                  ],
                )
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){controller.handelAgreeFriend(userInfo);},
                  child: const Text("同意"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400]
                  ),
                  onPressed: (){controller.handelRefuseFriend(userInfo);},
                  child: const Text("拒绝"),
                ),
              )
              
            ],
          ),
    );
  }


}
