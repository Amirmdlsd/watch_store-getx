import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/cached_image.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/main_button.dart';
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
              : Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        basketController.basketList.isEmpty
                            ? SliverPadding(
                                padding: EdgeInsets.only(
                                  top: height * .4,
                                ),
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
                            : SliverPadding(
                                padding: EdgeInsets.only(bottom: height * .1),
                                sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                  return BasketItem(
                                    width: width,
                                    height: height,
                                    basket: basketController.basketList[index],
                                    basketController: basketController,
                                  );
                                },
                                        childCount: basketController
                                            .basketList.length)),
                              )
                      ],
                    ),
                    // total price
                    Visibility(
                      visible:
                          basketController.totalPrice.value.cartTotalPrice! > 0,
                      child: Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: height * .1,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // button
                              SizedBox(
                                width: width * .5,
                                height: height * .05,
                                child: basketController.loadingForPayment.value
                                    ? const LoadingWidget()
                                    : MainElevatedButton(
                                        bgColor: Colors.red,
                                        lable: "ادامه فرآیندخرید",
                                        onTap: () {
                                          basketController.payment();
                                        }),
                              )
                              //price
                              ,
                              Text(
                                  '${basketController.totalPrice.value.cartTotalPrice} تومان',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              AppDimens.small.width
                            ],
                          ),
                        ),
                      ),
                    )
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
      child: SvgPicture.asset(icon, width: 32),
    );
  }
}
