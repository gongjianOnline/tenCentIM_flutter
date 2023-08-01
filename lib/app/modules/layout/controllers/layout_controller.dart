import 'package:get/get.dart';
import "../../home/views/home_view.dart";
import "../../friend/views/friend_view.dart";
import "../../circle/views/circle_view.dart";
import "../../my/views/my_view.dart";
class LayoutController extends GetxController {

  /**调用obx的引用 */
  RxString navIndexA = "消息".obs;

  /**导航栏菜单 */
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
  void onInit() {
    super.onInit();
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
