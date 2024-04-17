import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/gen/assets.gen.dart';
import 'package:get/get.dart';

import '../../../route/named_class.dart';
import '../../utils/auth_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     Future.delayed(const Duration(seconds: 3), () {
      if (AuthManager
          .readToken()
          .isNotEmpty) {
        Get.offAndToNamed(NamedClass.mainScreen);
      } else {
        Get.offAndToNamed(NamedClass.sendSmsScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Image.asset(Assets.png.mainLogo.path)),
              const LoadingWidget(),
              AppDimens.large.height,
            ],
          )),
    );
  }
}
