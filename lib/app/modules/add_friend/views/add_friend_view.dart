import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/add_friend_controller.dart';

class AddFriendView extends GetView<AddFriendController> {
  const AddFriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            headerComponent(),
            searchComponent(),
            searchResult(),
          ],
        ),
      )
    );
  }

  /* 标题模块 */
  headerComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios,
                color: MyTheme.unimportantFontColor,
              ),
            ),
          ),
          const Text(
            "添加朋友",
            style: TextStyle(
              fontSize: 28,
              color: MyTheme.stressFontColor
            ),
          ),
        ],
      )
    );
  }

  /* 搜索框 */
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
          hintText: "搜索用户ID",
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

  /* 搜索结果 */
  searchResult(){
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      margin: const EdgeInsets.only(bottom: 20,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            margin: const EdgeInsets.only(right: 10),
            child: Image.asset("lib/assets/img/user.png"),
          ),
          Expanded(
            flex: 1,
            child:Container(
              height: 52,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child:const Text(
                      "南开大学网络教育学院",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyTheme.stressFontColor
                      ),
                    )
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "天津 西青区",
                      style: TextStyle(
                        fontSize: 14,
                        color: MyTheme.unimportantFontColor
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
