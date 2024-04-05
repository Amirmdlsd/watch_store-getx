import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/feature/feature_home/model/banner_model.dart';
import 'package:watch_store_getx/feature/feature_product_list/controller/controller.dart';

import 'package:get/get.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.width,
    required this.height,
    required this.brand,
  });

  final double width;
  final double height;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.find<ProductListController>().getProductByBrandId(brand.id),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .02),
        padding: EdgeInsets.symmetric(horizontal: height * .03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            color: AppColors.primaryColor),
        child: Center(child: Text(brand.title)),
      ),
    );
  }
}
