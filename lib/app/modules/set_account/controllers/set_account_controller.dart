import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/myTheme.dart';
import 'package:flutter_im/app/common/remind.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:get/get.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:intl/intl.dart';

import '../../../controllers/tencent_user_controller.dart';

class SetAccountController extends GetxController {

  TencentUserController tencentUserController = Get.find();

  /* 建立控制层和视图层的关联 */
  RxString titleName = "账号与安全".obs;

  /*
    * 表单数据
    * nickname 昵称  
    * genderName 性别
   */
  RxString nickname = "".obs;
  RxString userID = "".obs;
  RxString genderName = "".obs;
  RxString birthday = "".obs;
  RxString allowTypeName = "".obs;
  RxString selfSignature = "".obs;
  @override
  void onInit() {
    super.onInit();
    handleGetSelfInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  /* 查看用户信息 */
  handleGetSelfInfo()async{
    V2TimUserFullInfo selfInfo = await tencentUserController.tenCentGetSelfInfo();
    nickname.value = (selfInfo.nickName == null || selfInfo.nickName == "")?"":selfInfo.nickName as String;
    userID.value = "${selfInfo.userID}";
    genderName.value = selfInfo.gender == 1?"男":"女";
    /* 时间 格式化*/
    int timestamp = selfInfo.birthday as int;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000); // 将秒转换为毫秒
    DateTime localDateTime = dateTime.toLocal();
    String formattedDate = DateFormat('yyyy-MM-dd').format(localDateTime);
    birthday.value = formattedDate;
    /* 验证方式 */
    if(selfInfo.allowType == 0){allowTypeName.value="允许所有人加我好友";}
    if(selfInfo.allowType == 1){allowTypeName.value="不允许所有人加我好友";}
    if(selfInfo.allowType == 2){allowTypeName.value="加我好友需我确认";}
    /* 个性签名 */
    selfSignature.value = (selfInfo.selfSignature==null ||selfInfo.selfSignature=="")?"": selfInfo.selfSignature as String;
  }

  /* 昵称设置 */
  handleNickname(){
    Get.dialog(
        AlertDialog(
          content:Container( 
            height: 140,
            child: Column(
              children: [
                /* 标题 */
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "昵称",
                    style: TextStyle(
                      color: MyTheme.stressFontColor,
                      fontSize: 18
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: TextField(
                      maxLength: 10,
                      decoration:const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10,left:10,right:10),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val){
                        nickname.value = val;
                      },
                    ),
                  )
                ),
                /* 提交按钮 */
                InkWell(
                  onTap: ()async{
                    int resultCode = await tencentUserController.tenCentChangeSelfInfo(
                      V2TimUserFullInfo(nickName:nickname.value)
                    );
                    if(resultCode == 101){
                      Remind.toast("修改成功");
                      handleGetSelfInfo();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child:Container(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 4,bottom: 4),
                      decoration: BoxDecoration(
                        color: MyTheme.themeColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text(
                        "完成",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        )
    );
  }

  /* 性别选择框 */
  handleGender(context){
    Pickers.showSinglePicker(
      context,
      data: ['男生', '女生'],
      selectData: "男生",
      onConfirm: (p, position) async {
        int genderId  = 1;
        p == "男生"?genderId = 1:genderId = 2;
        int resultCode = await tencentUserController.tenCentChangeSelfInfo(
          V2TimUserFullInfo(gender:genderId)
        );
        if(resultCode == 101){
          Remind.toast("修改成功");
          handleGetSelfInfo();
        }
      }, 
    );
  }

  /* 验证方式 */
  handleVerify(context){
    Pickers.showSinglePicker(
      context,
      data: ['允许所有人加我好友', '不允许所有人加我好友','加我好友需我确认'],
      selectData: "允许所有人加我好友",
      pickerStyle: PickerStyle(
        textSize:18
      ),
      onConfirm: (p, position) async {
        int resultCode = await tencentUserController.tenCentChangeSelfInfo(
          V2TimUserFullInfo(allowType:position)
        );
        if(resultCode == 101){
          Remind.toast("修改成功");
          handleGetSelfInfo();
        }
      }, 
    );
  }

  /* 生日选择框 */
  handleBirthday(context){
    Pickers.showDatePicker(
      context,
      mode: DateMode.YMD,
      suffix: Suffix(years : ' 年', month: ' 月', days : ' 日'),
      selectDate: PDuration(year : 2023, month: 8, day: 2),
      onConfirm: (p) async {
        DateTime timeStamp = DateTime(p.year as int,p.month as int,p.day as int);
        int resultCode = await tencentUserController.tenCentChangeSelfInfo(
          V2TimUserFullInfo(birthday: timeStamp.millisecondsSinceEpoch ~/ 1000)
        );
        if(resultCode == 101){
          Remind.toast("修改成功");
          handleGetSelfInfo();
        }
      },
    );
  }

  /* 个性签名 */
  handleSignature(){
    Get.dialog(
        AlertDialog(
          content:Container( 
            height: 140,
            child: Column(
              children: [
                /* 标题 */
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "个性签名",
                    style: TextStyle(
                      color: MyTheme.stressFontColor,
                      fontSize: 18
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child:TextField(
                      maxLength: 14,
                      decoration:const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10,left:10,right:10),
                        border: OutlineInputBorder(),
                      ),
                      onChanged:(val){
                        selfSignature.value = val;
                      }

                    ),
                  )
                ),
                /* 提交按钮 */
                InkWell(
                  onTap: ()async{
                      int resultCode = await tencentUserController.tenCentChangeSelfInfo(
                      V2TimUserFullInfo(selfSignature:selfSignature.value)
                    );
                    if(resultCode == 101){
                      Remind.toast("修改成功");
                      handleGetSelfInfo();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child:Container(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 4,bottom: 4),
                      decoration: BoxDecoration(
                        color: MyTheme.themeColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text(
                        "完成",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        )
    );
  }



}
