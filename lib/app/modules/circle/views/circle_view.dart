import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/circle_controller.dart';

class CircleView extends GetView<CircleController> {
  const CircleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CircleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
