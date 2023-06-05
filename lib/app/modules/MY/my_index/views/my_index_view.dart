import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_index_controller.dart';

class MyIndexView extends GetView<MyIndexController> {
  const MyIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyIndexView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyIndexView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
