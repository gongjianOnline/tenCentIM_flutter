import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_friend_controller.dart';

class AddFriendView extends GetView<AddFriendController> {
  const AddFriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddFriendView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddFriendView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
