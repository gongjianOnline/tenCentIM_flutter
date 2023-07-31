import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:get/get.dart';

import '../controllers/my_code_controller.dart';

class MyCodeView extends GetView<MyCodeController> {
  const MyCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        margin: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerComponent(),
            Expanded(
              flex: 1,
              child: codeComponent(context),
            )
          ],  
        ),
      )
    );
  }

  /* 头部标题 */
  headerComponent(){
    return  Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Row(
        children: [
          InkWell(
            onTap: (){Get.back();},
            child: Container(
              child: Icon(Icons.arrow_back_ios,color: MyTheme.unimportantFontColor,),
            ),
          )
        ],
      ),
    );
  }

  /* 二维码信息 */
  codeComponent(context){
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20),
      padding: const EdgeInsets.only(left: 20,right: 20),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* 头像 昵称 位置  */
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 10),
                  child:Image.asset("lib/assets/img/user.png")
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child:const Text(
                          "南开大学网络教育学院",
                          style: TextStyle(
                            color: MyTheme.stressFontColor,
                            fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "天津 西青区",
                          style: TextStyle(
                            color: MyTheme.unimportantFontColor,
                            fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          /* 二维码 */
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: MediaQuery. of (context).size.width,
            height: 400,
            decoration: const BoxDecoration(
              // color: Colors.black12
            ),
            child: QrImageView(
              data: '南开大学网络教育学院',
              version: QrVersions.auto,
              padding:EdgeInsets.zero,
              size: 400.0,
              gapless: false,
              eyeStyle:const QrEyeStyle(eyeShape: QrEyeShape.square, color: MyTheme.themeColor),
              dataModuleStyle:const QrDataModuleStyle(dataModuleShape:QrDataModuleShape.square, color: MyTheme.themeColor),
            ),
          ),

          /* 文本提示 */
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              "扫一扫上面的二维码团，加我为好友",
              style: TextStyle(
                color: MyTheme.unimportantFontColor
              ),
            ),
          )

        ],
      ),
    );
  }


}
