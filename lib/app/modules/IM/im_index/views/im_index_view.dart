import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/im_index_controller.dart';

class ImIndexView extends GetView<ImIndexController> {
  const ImIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImIndexView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ImIndexView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
