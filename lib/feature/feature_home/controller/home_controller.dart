import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/endpoint/endpoints.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/feature/utils/dio_provider.dart';

import '../../../config/constant/dimens.dart';
import '../../../config/widget/main_button.dart';
import '../model/banner_model.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  RxList<BannerModel> bannerList = RxList();
  RxList<CategoryModel> categroyList = RxList();
  RxList<ProductModel> amazingProduct = RxList();
  RxList<ProductModel> mostSellPoduct = RxList();
  RxList<ProductModel> newsetPoduct = RxList();
  RxBool isLoading = false.obs;

  Future<dynamic> getHomeData() async {
    try {
      isLoading.value = true;
      var response = await DioProvider.getMethod(
          EndPoints.homeEndPoint);

      if (response.statusCode == 200) {
        response.data['data']['sliders'].forEach((element) {
          bannerList.add(BannerModel.fromJson(element));
        });
        response.data['data']['categories'].forEach((element) {
          categroyList.add(CategoryModel.fromJson(element));
        });
        response.data['data']['amazing_products'].forEach((element) {
          amazingProduct.add(ProductModel.fromMapJson(element));
        });
        response.data['data']['most_seller_products'].forEach((element) {
          mostSellPoduct.add(ProductModel.fromMapJson(element));
        });
        response.data['data']['newest_products'].forEach((element) {
          newsetPoduct.add(ProductModel.fromMapJson(element));
        });
      }
      isLoading.value = false;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      debugPrint(e.toString());
      return Column(
        children: [
          const Icon(Icons.error_outline),
          AppDimens.medium.height,
          MainElevatedButton(
              lable: "تلاش مجدد",
              onTap: () {
                getHomeData();
              })
        ],
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }
}
