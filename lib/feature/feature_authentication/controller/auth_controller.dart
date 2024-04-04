import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/endpoint/endpoints.dart';
import 'package:watch_store_getx/config/widget/custom_snackbar.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';
import 'package:watch_store_getx/feature/utils/dio_provider.dart';
import 'package:watch_store_getx/route/named_class.dart';

class AuthController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool loadingForCode = RxBool(false);
  TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneContoller = TextEditingController();
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController addressContoller = TextEditingController();
  final TextEditingController postalCodeContoller = TextEditingController();
  final TextEditingController verificationCodeContoller =
      TextEditingController();

  Future<bool> sendSms() async {
    try {
      loading.value = true;
      var response = await DioProvider.postMethod(
          {'mobile': mobileController.text}, EndPoints.sendSmsEndPoint);
      debugPrint(response.data['data']['code'].toString());
      CustomSnackBar.showSnackBar(response.data['data']['code'].toString());
      loading.value = false;
      if (response.data['result']) {
        Get.toNamed(NamedClass.getOtpScreen);
      }
      return response.data['result'];
    } on DioException catch (e) {
      loading.value = false;

      CustomSnackBar.showSnackBar(e.response?.data['message']);
      throw Exception(e.response?.data['message']);
    } catch (e) {
      loading.value = false;
      throw Exception(e.toString());
    }
  }

  Future<void> getOtpCode() async {
    try {
      loadingForCode.value = true;
      var response = await DioProvider.postMethod({
        'mobile': mobileController.text,
        'code': verificationCodeContoller.text
      }, EndPoints.checkSmsEndPoint);
      loadingForCode.value = false;
      AuthManager.saveToken(response.data['data']['token']);
      if (response.data['data']['is_registered']) {
        Get.offAndToNamed(NamedClass.homeScreen);
      } else {
        debugPrint('register');
      }
    } on DioException catch (e) {
      loadingForCode.value = false;

      CustomSnackBar.showSnackBar(e.response?.data['message']);
      throw Exception(e.response?.data['message']);
    } catch (e) {
      loadingForCode.value = false;
      throw Exception(e.toString());
    }
  }
}
