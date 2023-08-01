import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_im/app/common/AliIcon.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/myTheme.dart';
import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>WillPopScope(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          backgroundColor:MyTheme.themeColor,
          initialActiveIndex:controller.navIndex.value,
          items:  [
            TabItem(icon: AliIcon.message, title: controller.navIndexA.value),
            const TabItem(icon: AliIcon.friend, title: '朋友'),
            const TabItem(icon: AliIcon.circle, title: '圈子'),
            const TabItem(icon: AliIcon.my, title: '我的'),
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
          ),
      ), 
      onWillPop: ()async{
        /* 判断两秒内点击两次返回按钮则退出APP */
        if(controller.lastPopTime.value == null || DateTime.now().difference(controller.lastPopTime.value) > const Duration(seconds: 2)){
          Fluttertoast.showToast(
            msg: "在按一次退出应用",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(57, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16.0
          );
          controller.setLastPopTime();
        }else{
          /* 退出app */
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        return false;
      })
    );
  }
}
