import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:watch_store_getx/feature/utils/dio_provider.dart';

import '../../../config/endpoint/endpoints.dart';
import '../../../config/widget/custom_snackbar.dart';
import '../../../route/named_class.dart';
import '../model/product_detail_model.dart';

class ProductDetailController extends GetxController {
  final TextEditingController commentController = TextEditingController();
  RxBool loading = false.obs;
  RxBool loadingForSendComment = false.obs;
  Rx<ProductDetailesModel> productDetaill = ProductDetailesModel().obs;

  Future<ProductDetailesModel> getProductDetail(int id) async {
    try {
      loading.value = true;
      Get.toNamed(NamedClass.singleProductDetail);
      var response = await DioProvider()
          .getMethod(EndPoints.productDetailEndPoint + id.toString());
      debugPrint(response.data['data'][0].toString());

      productDetaill.value =
          ProductDetailesModel.fromJson(response.data['data'][0]);

      loading.value = false;

      return productDetaill.value;
    } on DioException catch (e) {
      CustomSnackBar.showSnackBar(e.response?.data['message']);
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> sendComment(int id) async {
    try {
      loadingForSendComment.value = true;
      var response = await DioProvider().postMethod(
          {'body': commentController.text, 'product_id': id},
          EndPoints.sendCommentEndPoint);
      getProductDetail(id);
      loadingForSendComment.value = false;
    } on DioException catch (e) {
      loadingForSendComment.value = false;

      throw Exception(e.response?.data['message']);
    } catch (e) {
      loadingForSendComment.value = false;

      throw Exception(e.toString());
    }
  }
}
