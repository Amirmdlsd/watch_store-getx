import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/main_button.dart';
import 'package:watch_store_getx/config/widget/main_input_widget.dart';
import 'package:watch_store_getx/feature/feature_authentication/controller/auth_controller.dart';
import 'package:watch_store_getx/gen/assets.gen.dart';
import 'package:get/get.dart';

class SendSmsScree extends StatelessWidget {
  SendSmsScree({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.png.mainLogo.path),
                AppDimens.xLarge.height,
                MainInputWidget(
                  time: 0.obs,
                    lable: AppStrings.enterYourNumber,
                    hintText: AppStrings.hintPhoneNumber,
                    textInputType: TextInputType.phone,
                    controller: authController.mobileController),
                AppDimens.medium.height,
                authController.loading.value
                    ? const LoadingWidget()
                    : MainElevatedButton(
                        lable: AppStrings.sendOtpCode, onTap: () {
                          authController.sendSms();
                })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
