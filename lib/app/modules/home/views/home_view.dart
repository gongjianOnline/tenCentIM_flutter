import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:badges/badges.dart' as badges;

import '../../../common/AliIcon.dart';
import '../../../common/timeFormat.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
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
    ));
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              controller.titleName.value,
              style: const TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
          InkWell(
            onTap: (){controller.searchCodeFn();},
            child: Container(
              child: const Icon(
                AliIcon.scan,
                color:MyTheme.themeColor
              ),
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
      children: controller.tencentSessionController.sessionList.map((item){
        return messageItem(item);
      }).toList().cast<Widget>(),
      // children: [
      //   messageItem(),
      //   messageItem(),
      //   messageItem(),
      // ],
    );
  }

  /* 单消息模块 */
  messageItem(V2TimConversation? sessionItem){
    return Ink(
      child: InkWell(
        onTap: (){
          controller.handelChart(sessionItem.userID);
          
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          height: 80,
          // margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*用户名和消息时间 */
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child:Text(
                                "${sessionItem!.showName}",
                                style:const TextStyle(
                                  color: MyTheme.stressFontColor,
                                  fontSize: 18
                                ),
                              ),
                            ),
                            
                            // ${sessionItem.unreadCount}
                            badges.Badge(
                              badgeContent: Text(
                                "${sessionItem.unreadCount}",
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              showBadge: sessionItem.unreadCount == 0?false:true,
                              position: badges.BadgePosition.topEnd(top:20,end: -4),
                              badgeStyle:const badges.BadgeStyle(
                                badgeColor: Color.fromRGBO(229, 115, 115, 1)
                              ),
                              child: Container(
                                child:Text(
                                  TimeFormat.toText(sessionItem.lastMessage?.timestamp,formatText:"HH:mm"),
                                  style: const TextStyle(
                                    color: MyTheme.unimportantFontColor,
                                    fontSize: 14
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                      ),

                      /*消息摘要 */
                      Container(
                        padding: EdgeInsets.only(right: 50),
                        child: Text(
                          "${sessionItem.lastMessage!.textElem?.text}",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}
