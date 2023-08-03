import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_friend_controller.dart';

class NewFriendView extends GetView<NewFriendController> {
  const NewFriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewFriendView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewFriendView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
