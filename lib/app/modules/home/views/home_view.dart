import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap:(index){
          controller.currentIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label:"消息"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.class_),
            label:"通讯录"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.supervised_user_circle_rounded),
            label:"我的"
          ),
        ],
      ) ,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child:controller.currentRouter[controller.currentIndex.value],
              )
            )
          ],
        ),
      )
    ));
  }
}
