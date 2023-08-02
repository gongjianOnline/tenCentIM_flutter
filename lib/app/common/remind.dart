import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/* 提醒封装 */
class Remind {
  static toast(message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(57, 0, 0, 0),
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}