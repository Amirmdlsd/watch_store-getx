import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/endpoint/endpoints.dart';
import 'package:watch_store_getx/config/widget/custom_snackbar.dart';
import 'package:watch_store_getx/feature/feature_basket/model/basket_model.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';
import 'package:watch_store_getx/feature/utils/dio_provider.dart';

class BasketController extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingForCount = false.obs;
  RxBool loadingForItem = false.obs;
  RxList<BasketModel> basketList = RxList();

  Future<void> addToBasket(int id) async {
    try {
      loading.value = true;
      var response = await DioProvider()
          .postMethod({'product_id': id}, EndPoints.addToBasketasketEndPoint);
      loading.value = false;
      CustomSnackBar.showSnackBar(response.data['message']);
      getAllBasketItem();
    } on DioException catch (e) {
      loading.value = false;

      CustomSnackBar.showSnackBar(e.response?.data['message']);

      throw Exception(e.response?.data['message']);
    } catch (e) {
      loading.value = false;

      CustomSnackBar.showSnackBar('خطایی ره داده است');
      throw Exception(e.toString());
    }
  }

  Future<void> getAllBasketItem() async {
    try {
      loadingForItem.value = true;

      var response =
      await DioProvider().postMethod({}, EndPoints.basketasketEndPoint);
      RxList<BasketModel> basket = RxList();

      if (response.statusCode == 200) {
        debugPrint(response.data['data']['user_cart'].toString());
        response.data['data']['user_cart'].forEach((json) {
          basket.add(BasketModel.fromJson(json));
        });
      }
      basketList.assignAll(basket);
      loadingForItem.value = false;
    } on DioException catch (e) {
      loadingForItem.value = false;

      CustomSnackBar.showSnackBar(e.response?.data['message']);

      throw Exception(e.response?.data['message']);
    } catch (e) {
      loadingForItem.value = false;
      CustomSnackBar.showSnackBar('خطایی رخ داده است');
      throw Exception(e.toString());
    }
  }

  Future<void> removeFromBasket(int id) async {
    try {
      var response = await DioProvider()
          .postMethod({'product_id': id}, EndPoints.basketasketRemoveEndPoint);
      getBasketAgain();
    } on DioException catch (e) {
      CustomSnackBar.showSnackBar(e.response?.data['message']);

      throw Exception(e.response?.data['message']);
    } catch (e) {
      CustomSnackBar.showSnackBar('خطایی ره داده است');
      throw Exception(e.toString());
    }
  }

  Future<void> deleteFromBasket(int id) async {
    try {
      loadingForCount.value = true;
      var response = await DioProvider()
          .postMethod({'product_id': id}, EndPoints.basketasketDeleteEndPoint);
      loadingForCount.value = false;
      getBasketAgain();
    } on DioException catch (e) {
      loadingForCount.value = false;


      throw Exception(e.response?.data['message']);
    } catch (e) {
      loadingForCount.value = false;

      CustomSnackBar.showSnackBar('خطایی ره داده است');
      throw Exception(e.toString());
    }
  }

  Future<void> getBasketAgain()async {
    try {
      var response =
          await DioProvider().postMethod({}, EndPoints.basketasketEndPoint);
      RxList<BasketModel> basket = RxList();

      if (response.statusCode == 200) {
        debugPrint(response.data['data']['user_cart'].toString());
        response.data['data']['user_cart'].forEach((json) {
          basket.add(BasketModel.fromJson(json));
        });
      }
      basketList.assignAll(basket);
      loadingForItem.value = false;
    } on DioException catch (e) {
      CustomSnackBar.showSnackBar(e.response?.data['message']);

      throw Exception(e.response?.data['message']);
    } catch (e) {
      CustomSnackBar.showSnackBar('خطایی رخ داده است');
      throw Exception(e.toString());
    }
  }

  Future<void> addToCounter(int id) async{
    try {
      var response = await DioProvider()
          .postMethod({'product_id': id}, EndPoints.addToBasketasketEndPoint);
      loadingForCount.value = false;
      getBasketAgain();
    } on DioException catch (e) {
      CustomSnackBar.showSnackBar(e.response?.data['message']);

      throw Exception(e.response?.data['message']);
    } catch (e) {
      CustomSnackBar.showSnackBar('خطایی ره داده است');
      throw Exception(e.toString());
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBasketItem();
  }
}
