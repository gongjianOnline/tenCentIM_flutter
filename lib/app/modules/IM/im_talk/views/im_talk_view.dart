import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/im_talk_controller.dart';
import '../../../../Component/IMChat.dart';

class ImTalkView extends GetView<ImTalkController> {
  const ImTalkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation:0,
        automaticallyImplyLeading: false,
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
      body: GestureDetector(
        onTap:()=>controller.hideKeyboard(context),
        child: Container(
          child: Column(
            children: [
              // 聊天区域
              Expanded(
                flex: 1,
                child: Container(
                  child:ListView(
                    children: [
                      IMChat.myChat(),
                      IMChat.othersChat(),
                      IMChat.IMPrompt("2月17日 上午09:34"),
                    ],
                  ),
                )
              ),

              // 对话栏
              footComponent(context),
              // 扩展栏
              footComponentExtend(context),
              // 底部模块的切换
              controller.emoteStatus.value == 1?emoteComponent():Container()
            ],
          ),
        ),
      )
    ));
  }

  // 头部
  headerComponent(){
    return Container(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back_ios)
          ),
          Container(
            child: Text(
              "${controller.dialogueName.value}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Container(
            child: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  // 底部栏
  footComponent(context){
    return Container(
      // margin: EdgeInsets.only(),
      // padding: const EdgeInsets.only(bottom: 16),
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child:Container(
              margin: EdgeInsets.only(right: 10),
              child: TextField(
                
                // focusNode:controller.inputFocusNode,
                // onTap:controller.inputOnTap,
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
                
              ),
            )
          ),
          Container(
            width: 60,
            height: 32,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration:BoxDecoration(
              color: const Color.fromRGBO(117, 197, 243, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "发送",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }

  // 底部栏扩展
  footComponentExtend(context){
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){},
            child:const Icon(
              Icons.keyboard_voice,
              color: Color.fromRGBO(77, 77, 77, 1),
              size: 28,
            ) ,
          ),
          InkWell(
            onTap: (){
              controller.hideKeyboard(context);
              controller.emoteStatus.value = 1;
            },
            child:const Icon(
              Icons.sentiment_satisfied_alt,
              color: Color.fromRGBO(77, 77, 77, 1),
              size: 28,
            ) ,
          ),
          InkWell(
            onTap: (){},
            child:const Icon(
              Icons.photo_camera,
              color: Color.fromRGBO(77, 77, 77, 1),
              size: 28,
            ) ,
          ),
          InkWell(
            onTap: (){},
            child:const Icon(
              Icons.insert_photo,
              color: Color.fromRGBO(77, 77, 77, 1),
              size: 28,
            ) ,
          )
        ],
      ),
    );
  }

  // 表情模块
  emoteComponent(){
    return Container(
      height: 260,
      child: const Text("表情包"),
    );
  }

}
