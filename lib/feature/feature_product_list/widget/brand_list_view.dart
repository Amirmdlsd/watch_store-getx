import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/widget/brand_item.dart';
import 'package:watch_store_getx/feature/feature_home/model/banner_model.dart';
import 'package:watch_store_getx/feature/feature_product_list/screen/product_list_screen.dart';

class BrandListItem extends StatelessWidget {
  const BrandListItem({
    super.key,
    required this.brandList,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final List<BrandModel> brandList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: brandList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => BrandItem(
        width: width,
        height: height,
        brand: brandList[index],
      ),
    );
  }
}
