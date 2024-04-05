import 'package:flutter/material.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/route/named_class.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ElevatedButton(
        onPressed: () {
            AuthManager.removeToken();
            Get.offAndToNamed(NamedClass.sendSmsScreen);
        },
        child: Text('log out'),
      )),
    );
  }
}
