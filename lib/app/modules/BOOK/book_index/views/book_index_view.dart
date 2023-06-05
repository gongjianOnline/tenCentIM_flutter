import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_index_controller.dart';

class BookIndexView extends GetView<BookIndexController> {
  const BookIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title:const Text("联系人"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 218, 253, 1), 
              Color.fromRGBO(1, 169, 253, 1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
      body:Container(
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            contactsItemComponent()
          ],
        ),
      ),
    );
  }

  contactsItemComponent(){
    return Container(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
      decoration:BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color.fromARGB(255, 235, 234, 234)), // 设置下边框
        ),
      ),
      child:const Text(
        "张三",
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400
        )
      ),
    );
  }
}
