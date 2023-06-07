import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:const EdgeInsets.only(bottom: 16),
              child: Text(
                controller.title.value,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: "用户名", // 提示词
                    border: OutlineInputBorder(), // 带边框
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16,right: 16),
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10)
                      ),
                      onPressed: (){
                        controller.handelLogin();
                        
                      }, 
                      child: const Text("登录",style: TextStyle(fontSize: 20),)
                    )
                  )
                ],
              ),
            )


          ],
        )
      ),
    ));
  }
}
