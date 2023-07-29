import 'package:flutter/material.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../../common/myTheme.dart';
import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor:MyTheme.themeColor,
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
        decoration: const BoxDecoration(
          color: MyTheme.bgColor
        ),
        width: MediaQuery. of (context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child:AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          child: controller.routerList[controller.navIndex.value]
        )
      )
    ));
  }
}
