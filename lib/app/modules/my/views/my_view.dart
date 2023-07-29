import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  /* 头部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Text(
              "我的",
              style: TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          Container(
            child: const Icon(
              Icons.settings_sharp,
              color:MyTheme.themeColor
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
      child: Column(
        children: [
          Container(
            width:60,
            height: 60,
            child: Image.asset("lib/assets/img/user.png"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            child:const Text(
              '南开大学网络教育学院',
              style: TextStyle(
                fontSize: 16,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: const Text(
              "ID: 123456789",
              style: TextStyle(
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
          singleComponent(const Icon(Icons.headphones,color: MyTheme.stressFontColor,size: 28,),"关于我们","http://www.gjweb.top"),
          singleComponent(const Icon(Icons.info_outline,color: MyTheme.stressFontColor,size: 28,),"版本号","V 1.0.0"),
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
