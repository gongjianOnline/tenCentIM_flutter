import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/myTheme.dart';
import '../controllers/set_account_controller.dart';

class SetAccountView extends GetView<SetAccountController> {
  const SetAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: const Color.fromRGBO(246,246,246,1),
        child: Column(
          children: [
            headerComponent(),
            
            rowComponent("昵称","请设置昵称",true),
            rowComponent("ID","admin",false),
            rowComponent("性别","男",true),
            rowComponent("生日","",true),
            rowComponent("好友验证方式","允许所有人加我好友",true),
            rowComponent("个性签名","",true),

          ],
        ),
      )
    ));
  }

  /* 标题模板 */
  headerComponent(){
    return Container(
      color:Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
      child: Row(
        children: [
          InkWell(
            onTap: (){Get.back();},
            child: Container(
              child: const Icon(
                Icons.arrow_back_ios_new,
                color:MyTheme.unimportantFontColor
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              controller.titleName.value,
              style:const TextStyle(
                fontSize: 28,
                color: MyTheme.stressFontColor
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /* 单行模版 */
  rowComponent(title,infoValue,isNext){
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1
            )
          )
        ),
        padding: const EdgeInsets.only(left: 20,right: 10,top: 20,bottom:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* 标题 */
            Text(
              title,
              style:const TextStyle(
                color: MyTheme.stressFontColor,
                fontSize: 18
              ),
            ),
            /* 内容 & 是否可以点击按钮 */
            Container(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      infoValue,
                      style:const TextStyle(
                        color: MyTheme.stressFontColor,
                        fontSize: 18
                      )
                      
                    ),
                  ),
                  isNext?Container(
                    child: const Icon(
                      Icons.navigate_next_rounded,
                      color: MyTheme.stressFontColor,
                      size: 22,
                    ),
                  ):const Padding(padding: EdgeInsets.only(right: 20))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
