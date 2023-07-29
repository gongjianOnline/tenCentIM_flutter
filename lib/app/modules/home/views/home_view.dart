import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color:MyTheme.bgColor
        ),
        width: MediaQuery. of (context).size.width,
        child: Column(
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: messageComponent()
            )
          ],
        ),
      )
    );
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Text(
              "消息",
              style: TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          Container(
            child: const Icon(
              Icons.qr_code_scanner,
              color:MyTheme.themeColor
            ),
          )
        ],
      ),
    );
  }

  /* 信息模块 */
  messageComponent(){
    return ListView(
      padding: const EdgeInsets.only(top:10,bottom: 20),
      children: [
        messageItem(),
        messageItem(),
        messageItem(),
      ],
    );
  }

  /* 单消息模块 */
  messageItem(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          /* 头像 */
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              // color: const Color.fromRGBO(228, 228, 228, 1),
            ),
            child: Image.asset(
              "lib/assets/img/user.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*用户名和消息时间 */
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text(
                            "放牛娃",
                            style: TextStyle(
                              color: MyTheme.stressFontColor,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Container(
                          child: const Text(
                            "15:21",
                            style: TextStyle(
                              color: MyTheme.unimportantFontColor,
                              fontSize: 14
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  /*消息摘要 */
                  Container(
                    padding: EdgeInsets.only(right: 50),
                    child: const Text(
                      "真傻逼真傻逼真傻逼真傻逼真傻逼真傻逼真傻逼真傻逼真傻逼真傻逼",
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: MyTheme.unimportantFontColor,
                        fontSize: 14
                      ),
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
}
