import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/cached_image.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/feature/feature_basket/controller/basket_controller.dart';
import 'package:watch_store_getx/feature/feature_basket/model/basket_model.dart';
import 'package:watch_store_getx/gen/assets.gen.dart';

import '../widget/basket_item.dart';
import 'package:get/get.dart';

class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  final basketController = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => basketController.loadingForItem.value
              ? const Center(child: LoadingWidget())
              : CustomScrollView(
                  slivers: [
                    basketController.basketList.isEmpty
                        ? SliverPadding(
                            padding: EdgeInsets.only(top: height * .4),
                            sliver: SliverToBoxAdapter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.remove_shopping_cart,
                                    size: 50,
                                  ),
                                  AppDimens.medium.height,
                                  const Text(
                                    'سبد خرید شما خالی است',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                            return BasketItem(
                              width: width,
                              height: height,
                              basket: basketController.basketList[index],
                              basketController: basketController,
                            );
                          }, childCount: basketController.basketList.length))
                  ],
                ),
        ),
      ),
    );
  }
}

class BasketIconWidget extends StatelessWidget {
  const BasketIconWidget({super.key, required this.onTap, required this.icon});

  final Function() onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(icon,
          width: MediaQuery.of(context).size.width * .07),
    );
  }
}
