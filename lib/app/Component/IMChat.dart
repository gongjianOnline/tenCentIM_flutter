
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IMChat{

  static myChat(){
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200.0,
            ),
            padding: const EdgeInsets.only(left:16,right: 16,top: 10,bottom: 10 ),
            margin: const EdgeInsets.only(left: 61,right: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10)
              ),
              color:Colors.blue
            ),
            child: const Text(
              "巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Container(
            width: 34,
            height: 34,
            child: IdentifyAvatars("","火蓝")
          )
        ],
      ) ,
    );
  }

  static othersChat(){
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            child: InkWell(
              onTap: (){
                print("个人信息");
                Get.toNamed("/im-user");
              },
              child: IdentifyAvatars("","龚箭"),
            )
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200.0,
            ),
            padding: const EdgeInsets.only(left:16,right: 16,top: 10,bottom: 10 ),
            margin: const EdgeInsets.only(left: 16,right: 61),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)
              ),
              color:Colors.blue
            ),
            child: const Text(
              "巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ],
      ) ,
    );
  }

  static IMPrompt(name){
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // width: 154,
            padding: const EdgeInsets.only(left: 22.5,right: 22.5,top: 4.5,bottom: 4.5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1),
              borderRadius:BorderRadius.circular(10)
            ),
            child: Text(
              name,
              style:const TextStyle(
                color: Color.fromRGBO(143, 143, 146, 1),
                fontSize: 13
              ),
            ),
          )
        ],
      ),
    );
  }

  // 识别头像
  static IdentifyAvatars(String? url,String userName ){
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
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child:Image.asset("assets/images/3.0x/$url.png")
      );
    }
    
  }




}