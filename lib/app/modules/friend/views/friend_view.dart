import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';

import 'package:get/get.dart';

import '../controllers/friend_controller.dart';

class FriendView extends GetView<FriendController> {
  const FriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          color: MyTheme.bgColor
        ),
        child: Column(
          children: [
            headerComponent(),
            searchComponent(),
            Expanded(
              flex: 1,
              child: friendListComponent()
            )
          ],
        )
      )
    );
  }

  /* 顶部模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 1,top: 1),
            decoration: BoxDecoration(
              color:MyTheme.themeColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: const Text("好友",style: TextStyle(color: Colors.white),),
          ),
          Container(
            child: const Icon(
              Icons.add_circle_outline,
              color: MyTheme.unimportantFontColor,
              size: 26,
            ),
          )
        ],
      ),
    );
  }

  /* 搜索模块 */
  searchComponent(){
    return  Container(
      height:32,
      margin: const EdgeInsets.only(top: 14,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const TextField(
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "搜索",
          hintStyle:TextStyle(color:Color.fromRGBO(206, 206, 206, 1)),
          contentPadding: EdgeInsets.symmetric(vertical:9,horizontal:-10), // 调整上下内边距
          border: InputBorder.none,
          icon:Padding(
            padding:  EdgeInsets.only(left: 10,),
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(228, 228, 228, 1),
            ),
          )
        ),
      ),
    );
  }

  /*好友列表 */
  friendListComponent(){
    return ListView(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      children: [],
    );
  }

  /* 好友信息 */

}
