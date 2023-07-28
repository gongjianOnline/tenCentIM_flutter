import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor:const Color.fromRGBO(0, 204, 153, 1),
        initialActiveIndex:controller.navIndex.value,
        items: const [
          TabItem(icon: AliIcon.message, title: '消息'),
          TabItem(icon: AliIcon.friend, title: '朋友'),
          TabItem(icon: AliIcon.circle, title: '圈子'),
          TabItem(icon: AliIcon.my, title: '我的'),
        ],
        onTap: (int i){controller.checkNavIndex(i);},
      ),
      body: Container(
        width: MediaQuery. of (context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child:controller.routerList[controller.navIndex.value]
      )
    ));
  }
}
