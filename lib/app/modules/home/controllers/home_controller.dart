import 'package:get/get.dart';
import "../../IM/im_index/views/im_index_view.dart";
import "../../BOOK/book_index/views/book_index_view.dart";
import '../../MY/my_index/views/my_index_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString title = "腾讯IM".obs;

  // navBar
  RxInt currentIndex = 0.obs;
  RxMap currentRouter = {
    0:const ImIndexView(),
    1:const BookIndexView(),
    2:const MyIndexView()
  }.obs;

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


}
