import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/endpoint/endpoints.dart';
import 'package:watch_store_getx/config/widget/custom_snackbar.dart';
import 'package:watch_store_getx/feature/feature_product_list/model/baner_model.dart';
import 'package:watch_store_getx/feature/utils/dio_provider.dart';
import 'package:watch_store_getx/route/named_class.dart';

import '../../feature_home/model/banner_model.dart';
import '../../feature_home/model/product_model.dart';

class ProductListController extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingForProductt = false.obs;
  RxList<BrandModel> brandList = RxList();
  RxList<ProductModel> productList = RxList();

  Future<List<BrandModel>> getBrand() async {
    try {
      loading.value = true;
      var response = await DioProvider().getMethod(EndPoints.brandEndPoint);
      if (response.statusCode == 200) {
        response.data['all_brands']
            .forEach((json) => brandList.add(BrandModel.fromJson(json)));
      }
      loading.value = false;
      return brandList;
    } on DioException catch (e) {
      loading.value = false;
      debugPrint(e.response?.data['message']);
      throw Exception(e.response?.data['message']);
    } catch (e) {
      loading.value = false;
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProduct(int id) async {
    try {
      Get.toNamed(NamedClass.productListScreen);
      loading.value = true;
      var response = await DioProvider()
          .getMethod(EndPoints.productByCategoryIdEndPoint + id.toString());
      RxList<ProductModel> list = RxList();

      if (response.statusCode == 200) {
        response.data['products_by_category']['data']
            .forEach((json) => list.add(ProductModel.fromMapJson(json)));
      }
      productList.assignAll(list);

      loading.value = false;

      return productList;
    } on DioException catch (e) {
      loading.value = false;
      throw Exception(e.response?.data['message']);
    } catch (e) {
      loading.value = false;
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProductByBrandId(int id) async {
    try {
      loadingForProductt.value = true;
      var respone = await DioProvider()
          .getMethod(EndPoints.productByBrandIdEndPoint + id.toString());
      RxList<ProductModel> product = RxList();

      if (respone.statusCode == 200) {
        respone.data['products_by_brands']['data']
            .forEach((json) => product.add(ProductModel.fromMapJson(json)));
        productList.assignAll(product);
      }
      loadingForProductt.value = false;
      return productList;
    } on DioException catch (e) {
      loadingForProductt.value = false;

      CustomSnackBar.showSnackBar(e.response?.data['message']);
      throw Exception(e.response?.data['message']);
    } catch (e) {
      loadingForProductt.value = false;

      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBrand();
  }
}
