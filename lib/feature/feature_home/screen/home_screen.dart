import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/widget/app_slider.dart';
import 'package:watch_store_getx/config/widget/category_item_chip.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/search_bar.dart';
import 'package:watch_store_getx/feature/feature_home/widget/category_list_view.dart';
import 'package:watch_store_getx/feature/feature_home/widget/home_product_list_view.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';

import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    debugPrint('Bearer ${AuthManager.readToken()}');
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => homeController.isLoading.value
              ? const Center(
                  child: LoadingWidget(),
                )
              : CustomScrollView(
                  slivers: [
                    AppSearchBar(),
                    AppBannerSlider(),
                    CategoryListView(),
                    SliverToBoxAdapter(
                      child: ProductListView(
                          homeProductList: homeController.amazingProduct,
                          title: AppStrings.amazing),
                    ),
                    SliverToBoxAdapter(
                      child: ProductListView(
                          homeProductList: homeController.mostSellPoduct,
                          title: AppStrings.topSells),
                    ),
                    SliverToBoxAdapter(
                      child: ProductListView(
                          homeProductList: homeController.newsetPoduct,
                          title: AppStrings.newestProduct),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
