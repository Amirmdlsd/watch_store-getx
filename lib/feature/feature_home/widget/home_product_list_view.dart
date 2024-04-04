import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/product_item.dart';

import '../../../gen/assets.gen.dart';
import '../controller/home_controller.dart';
import '../model/product_model.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key, required this.homeProductList, required this.title,
  });
final String title;
  final List<ProductModel> homeProductList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(
          top: size.height * .03,
        ),
        height: size.height * .34,
        width: double.infinity,
        child: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AppDimens.large.width,
                RotatedBox(
                  quarterTurns: -1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                         title,
                          style:const TextStyle(
                              color: AppColors.amazingColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.viewAll,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 18)),
                            AppDimens.small.width,
                            SvgPicture.asset(
                              Assets.svg.back,
                              height: 15,
                            )
                          ],
                        )
                      ]),
                ),
                AppDimens.large.width,
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeProductList.length,
                    itemBuilder: (context, index) => ProductItem(
                        product: homeProductList[index])),
              ],
            ),
          ),
        ));
  }
}
