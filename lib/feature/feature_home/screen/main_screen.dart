import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/gen/assets.gen.dart';

import '../../utils/auth_manager.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    debugPrint("token is ${AuthManager.readToken()}");

    return Scaffold(
        body: SafeArea(
            child: Obx(
              ()=> IndexedStack(
                        index: currentIndex.value,
                        children: [HomeScreen()],
                      ),
            )),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: (value) {
              debugPrint(currentIndex.value.toString());
              currentIndex.value = value;
            },
            iconSize: 32,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset(Assets.svg.home, color: Colors.black),
                  label: "خانه",
                  icon: SvgPicture.asset(Assets.svg.home, color: Colors.grey)),
              BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset(Assets.svg.basket, color: Colors.black),
                  label: "سبدخرید",
                  icon: SvgPicture.asset(Assets.svg.basket)),
              BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset(Assets.svg.user, color: Colors.black),
                  label: "پروفایل",
                  icon: SvgPicture.asset(Assets.svg.user)),
            ],
            currentIndex: currentIndex.value,
          ),
        ));
  }
}
