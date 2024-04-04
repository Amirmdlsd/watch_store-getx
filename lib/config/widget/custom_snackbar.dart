import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/dimens.dart';

class CustomSnackBar {
  static showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      titleText: Text(message, style: TextStyle(color: Colors.white)),
      duration: const Duration(seconds: 2),
      messageText: Text(''),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppDimens.medium),
    ));
  }
}
