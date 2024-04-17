import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/endpoint/endpoints.dart';
import 'package:watch_store_getx/feature/feature_profile/model/user_model.dart';
import 'package:watch_store_getx/feature/utils/dio_provider.dart';

class UserControllr extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  RxBool loading = false.obs;

  Future<void> getUserInfo() async {
    try {
      loading.value = true;
      var respone =
          await DioProvider().postMethod({}, EndPoints.profileEndPoint);
      if (respone.statusCode == 200) {
        user.value = UserModel.fromJson(respone.data['data']['user_info']);
      }
      debugPrint(user.value.name.toString());
      loading.value = false;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserInfo();
  }
}
