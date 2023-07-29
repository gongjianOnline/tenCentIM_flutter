import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
