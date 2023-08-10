import "package:flutter_im/app/common/storage.dart";
import 'package:get/get.dart';
import '../../../controllers/circle_list_controller.dart';
import "../../home/views/home_view.dart";
import "../../friend/views/friend_view.dart";
import "../../circle/views/circle_view.dart";
import "../../my/views/my_view.dart";
import "../../../controllers/tencent_relationship_controller.dart";
class LayoutController extends GetxController {
  /* 调用好友关系链模块 */
  TencentRelationshipController tencentRelationshipController = Get.find();
  /* 调用朋友圈模块 */
  CircleListController circleController = Get.find();

  /*调用obx的引用 */
  RxString navIndexA = "消息".obs;

  /*导航栏菜单 */
  RxInt navIndex = 0.obs;
  /*路由*/
  RxList routerList = const [
    HomeView(),
    FriendView(),
    CircleView(),
    MyView()
  ].obs;

  /* 两次返回退出应用程序 */
  var lastPopTime = DateTime.now().obs;


  @override
  void onInit()async{
    super.onInit();
    /* 拉去好友请求列表 */
    tencentRelationshipController.tencentGetFriendApply();
    /* 获取用户的腾讯ID */
    var tcUserId = await Storage.getData("tcUserID");
    /* 监听菜单栏下标变化 */
    ever(navIndex,(val)async{
      /* 当菜单栏进入朋友圈状态时,拉去朋友圈列表 */
      if(val == 2){
        circleController.handelCircleList(tcUserId);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /*切换底部底部导航 */
  checkNavIndex(newValue){
    navIndex.value = newValue;
  }

  /* 退出APP */
  setLastPopTime(){
    lastPopTime.value = DateTime.now();
    update();
  }


}
