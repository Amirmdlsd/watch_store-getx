import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/product_item.dart';
import 'package:watch_store_getx/feature/feature_home/model/banner_model.dart';
import 'package:watch_store_getx/feature/feature_product_list/controller/controller.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_product_list/widget/brand_list_view.dart';

import '../../../gen/assets.gen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final String mostView = "بیشترین بازدید";

  final String expensive = "بیشترین قیمت";

  final String cheapest = "کمترین قیمت";

  String category = "دسته بندی";
  final ProductListController controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => controller.loading.value
            ? const Center(child: LoadingWidget())
            : Padding(
                padding: EdgeInsets.symmetric(vertical: height * .02),
                //brand
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(AppDimens.medium))),
                      backgroundColor: AppColors.appbar,
                      elevation: 2,
                      forceElevated: true,
                      shadowColor: AppColors.shadow,
                      automaticallyImplyLeading: false,
                      actions: [
                        AppDimens.medium.width,
                        GestureDetector(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(Assets.svg.close)),
                        const Spacer(),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              onTap: () {},
                              value: expensive,
                              child: Text(expensive),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              value: cheapest,
                              child: Text(cheapest),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              value: mostView,
                              child: Text(mostView),
                            ),
                          ],
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svg.sort),
                              AppDimens.small.width,
                              Text('دسته بندی',
                                  style:
                                      Theme.of(context).textTheme.displayMedium)
                            ],
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(Assets.svg.basket),
                        AppDimens.medium.width,
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: AppDimens.large.height,
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: height * .04,
                        width: double.infinity,
                        child: BrandListItem(
                            width: width,
                            height: height,
                            brandList: controller.brandList),
                      ),
                    ),
                    controller.loadingForProductt.value
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: LoadingWidget(),
                            ),
                          )
                        : SliverPadding(
                            padding: EdgeInsets.only(top: height * .04),
                            sliver: SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => ProductItem(
                                        product: controller.productList[index]),
                                    childCount: controller.productList.length),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .6)),
                          )
                  ],
                ),
              ),
      )),
    );
  }
}
