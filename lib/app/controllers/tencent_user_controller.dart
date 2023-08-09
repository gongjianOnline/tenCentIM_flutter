import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';


/* 用户登录相关操作 */
class TencentUserController extends GetxController {


  @override
  void onInit() {
    super.onInit();
    tenCentLoginStatus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 腾讯IM登录 */
  tenCentLogin(userID,userSig,userName)async{
    V2TimCallback res = 
      await TencentImSDKPlugin.v2TIMManager.login(userID: userID, userSig: userSig);
    if(res.code == 0){
      print("登录成功");
      /**获取用户信息 */
      V2TimUserFullInfo userInfo = await tenCentGetSelfInfo();
      /**如果昵称为空则设置用户名为昵称,将验证好友方式改为需要我验证方式 */
      if(userInfo.nickName == null){
        await tenCentChangeSelfInfo(V2TimUserFullInfo(nickName:userName,allowType:1));
      }
      Get.offAndToNamed("/layout");
    }else{
      print("登录失败");
    }
  }

  /* 腾讯IM用户登录状态 */
  tenCentLoginStatus()async{
    V2TimValueCallback<int> getLoginStatusRes =
        await TencentImSDKPlugin.v2TIMManager.getLoginStatus();
    if (getLoginStatusRes.code == 0) {
      int? status = getLoginStatusRes.data; // getLoginStatusRes.data为用户登录状态值
      if (status == 1) {
        print("用户已登录");
        Get.offAndToNamed("/layout");
      } else if (status == 2) {
        print("登录中");
      } else if (status == 3) {
        print("未登录");
        // Get.offAndToNamed("/login");
      }
    }
  }

  /* 腾讯IM获取登录用户的userID */
  Future tenCentLoginUserID()async{
    V2TimValueCallback<String> getLoginUserRes =
        await TencentImSDKPlugin.v2TIMManager.getLoginUser();
    if (getLoginUserRes.code == 0) {
      // getLoginUserRes.data为查询到的登录用户的UserID
      return getLoginUserRes.data;
    }
  }

  /* 腾讯IM用户退出 */
  tenCentLogout()async{
    V2TimCallback logoutRes = await TencentImSDKPlugin.v2TIMManager.logout();
    if(logoutRes.code == 0){
      Get.offAllNamed("/login");
    }
  }

  /**查看登录用户的个人信息 */
  tenCentGetSelfInfo()async{
    var userID =  await tenCentLoginUserID();
    V2TimValueCallback<List<V2TimUserFullInfo>> getUsersInfoRes = 
      await TencentImSDKPlugin.v2TIMManager.getUsersInfo(userIDList: [userID]);
    if(getUsersInfoRes.code == 0){
      return getUsersInfoRes.data?[0];
    }
  }

  /* 改变登录用户信息 */
  Future tenCentChangeSelfInfo(V2TimUserFullInfo selfInfo)async{
    V2TimCallback setSelfInfoRes =
      await TencentImSDKPlugin.v2TIMManager.setSelfInfo(userFullInfo: selfInfo);//用户资料设置信息
      if (setSelfInfoRes.code == 0) {
        return 101;
      }
  }


}
