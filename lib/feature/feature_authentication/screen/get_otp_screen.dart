import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';

import '../../../config/constant/color.dart';
import '../../../config/constant/dimens.dart';
import '../../../config/widget/main_button.dart';
import '../../../config/widget/main_input_widget.dart';
import '../../../gen/assets.gen.dart';
import '../controller/auth_controller.dart';
import 'package:get/get.dart';

class GetOtpScreen extends StatefulWidget {
  GetOtpScreen({super.key});

  @override
  State<GetOtpScreen> createState() => _GetOtpScreenState();
}

class _GetOtpScreenState extends State<GetOtpScreen> {
  final AuthController authController = Get.put(AuthController());
  Timer? timer;
  RxInt time = 120.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(Assets.png.mainLogo.path,
                    width: size.width / 1.3, fit: BoxFit.cover),
              ),
              AppDimens.xLarge.height,
              Text(
                  AppStrings.otpCodeSendFor.replaceAll(
                      AppStrings.replace, authController.mobileController.text),
                  style: const TextStyle(
                      fontFamily: 'sm',
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              AppDimens.medium.height,
              const Text(AppStrings.wrongNumberEditNumber,
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 16)),
              AppDimens.large.height,
              // text-filed
              MainInputWidget(
                  showTimer: true,
                  time: time,
                  lable: AppStrings.enterVerificationCode,
                  hintText: AppStrings.hintVerificationCode,
                  textInputType: TextInputType.phone,
                  controller: authController.verificationCodeContoller),
              // button or loading
              AppDimens.medium.height,
              authController.loadingForCode.value
                  ? const LoadingWidget()
                  : MainElevatedButton(
                      lable: AppStrings.next,
                      onTap: () {
                        authController.getOtpCode();
                      }),

              if (time.value == 0) ...{
                AppDimens.medium.height,
                authController.loading.value
                    ? const LoadingWidget()
                    : MainElevatedButton(
                        lable: AppStrings.sendOtpCode,
                        onTap: () async {
                          var result = await authController.sendSms();

                          if (result == true) {
                            time.value = 120;
                            startTimer();
                          } else {
                            return;
                          }
                        })
              }
            ],
          ),
        ),
      ))),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startTimer();
  }
}
