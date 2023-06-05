import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_index_controller.dart';

class BookIndexView extends GetView<BookIndexController> {
  const BookIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookIndexView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookIndexView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
