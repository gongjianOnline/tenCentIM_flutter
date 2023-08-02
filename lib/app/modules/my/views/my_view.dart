import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/myTheme.dart';
import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        child: Column(
          children: [
            headerComponent(),
            userInfoComponent(context),
            operateComponent(),
            softwareInfoComponent()
          ],
        ),
      )
    ));
  }

  /* 头部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              controller.titleName.value,
              style:const TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          InkWell(
            onTap:(){Get.toNamed("/setting");},
            child: Container(
              child: const Icon(
                Icons.settings_sharp,
                color:MyTheme.themeColor
              ),
            ),
          )
        ],
      ),
    );
  }

  /* 用户信息 */
  userInfoComponent(context){
    return  Container(
      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
      padding: const EdgeInsets.only(top: 26,bottom: 26),
      width: MediaQuery. of (context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            child: InkWell(
              onTap: (){Get.toNamed("/myCode");},
              child: const Icon(Icons.qr_code_outlined,color: MyTheme.themeColor,),
            )
          ),
          Column(
            children: [
              Container(
                width:60,
                height: 60,
                child:(controller.selfInfo.value.faceUrl == "" || controller.selfInfo.value.faceUrl == null) ? 
                  Image.asset("lib/assets/img/user.png") : Image.network("${controller.selfInfo.value.faceUrl}"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child:Text(
                  "${controller.selfInfo.value.nickName ?? controller.selfInfo.value.userID}",
                  style:const TextStyle(
                    fontSize: 16,
                    color: MyTheme.stressFontColor
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  "ID: ${controller.selfInfo.value.userID}",
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
                child: const Text(
                  "快来找我聊天吧~",
                  style: TextStyle(
                    color: MyTheme.unimportantFontColor
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /* 操作模块 */
  operateComponent(){
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
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
                      Icons.help_center,
                      color: MyTheme.unimportantFontColor,
                      size: 32,
                    ),
                  ),
                  Container(
                    child: const Text(
                      "帮助",
                      style: TextStyle(color: MyTheme.unimportantFontColor),
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
            flex: 1,
            child:InkWell(
              onTap:(){Get.toNamed("/circleSeparate");},
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Icon(
                        AliIcon.circle,
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

  /*软件信息 */
  softwareInfoComponent(){
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: [
          singleComponent(const Icon(AliIcon.about,color: MyTheme.stressFontColor,size: 24,),"关于我们","http://www.gjweb.top"),
          singleComponent(const Icon(AliIcon.version,color: MyTheme.stressFontColor,size: 24,),"版本号","V 1.0.0"),
        ],
      ),
    );
  }

  /* 单列模块 */
  singleComponent(Icon iconName,String titleName,String data){
    return Ink(
      color: Colors.white,
      child:InkWell(
        onTap:(){
          if(titleName == "关于我们"){
            Get.toNamed("/webView",arguments:{"url":data});
          }
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: iconName,
                    ),
                    Container(
                      child: Text(
                        titleName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: MyTheme.unimportantFontColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              titleName == "关于我们"?Container(
                child: const Icon(
                  Icons.navigate_next_rounded,
                  color: MyTheme.unimportantFontColor,
                  size: 28,
                ),
              ):Container(
                child: Text(data,style:const TextStyle(color: MyTheme.unimportantFontColor),),
              )
            ],
          ),
        ),
      )
    );
  }
  
}
