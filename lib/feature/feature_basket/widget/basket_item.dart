import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/feature/feature_basket/controller/basket_controller.dart';

import '../../../config/constant/color.dart';
import '../../../config/constant/dimens.dart';
import '../../../config/widget/cached_image.dart';
import '../../../gen/assets.gen.dart';
import '../model/basket_model.dart';
import '../screen/basket_scren.dart';
import 'package:get/get.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({
    super.key,
    required this.width,
    required this.height,
    required this.basket,
    required this.basketController,
  });

  final double width;
  final double height;
  final BasketModel basket;
  final BasketController basketController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.height * .033),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .27,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(AppDimens.medium)),
      child: Row(
        children: [
          SizedBox(
            width: width * .3,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                child: CachedImage(imageUrl: basket.image)),
          ),
          AppDimens.medium.width,
          Obx(
            () => Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .02),
              child: Column(
                children: [
                  Text(basket.product,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 17)),
                  AppDimens.large.height,
                  Text('قیمت : ${basket.price} تومان',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.grey, fontSize: 16)),
                  AppDimens.medium.height,
                  Visibility(
                    visible: basket.discount > 0,
                    child: Text('باتخفیف : ${basket.discountPrice} تومان',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: AppColors.primaryColor, fontSize: 16)),
                  ),
                  AppDimens.medium.height,
                  Divider(
                    indent: 1,
                    endIndent: 1,
                    color: Colors.grey.shade500,
                  ),
                  AppDimens.medium.height,
                  Row(
                    children: [
                      BasketIconWidget(
                          onTap: () {
                            basket.isLoading.value = true;
                            debugPrint(basket.id.toString());
                            basketController.addToCounter(basket.productId);
                          },
                          icon: Assets.svg.plus),
                      AppDimens.medium.width,
                      basket.isLoading.value
                          ? const SizedBox(
                              width: 30,
                              height: 20,
                              child: LoadingWidget(),
                            )
                          : Text('${basket.count}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15)),
                      AppDimens.medium.width,
                      BasketIconWidget(
                          onTap: () {
                            basket.isLoading.value = true;
                            debugPrint(basket.id.toString());
                            basketController.removeFromBasket(basket.productId);
                          },
                          icon: Assets.svg.minus),
                      const Spacer(),
                      basket.isDeleting.value
                          ? const SizedBox(
                              width: 30,
                              height: 20,
                              child: LoadingWidget(),
                            )
                          : BasketIconWidget(
                              onTap: () {
                                basket.isDeleting.value = true;
                                debugPrint(basket.id.toString());
                                basketController
                                    .deleteFromBasket(basket.productId);
                              },
                              icon: Assets.svg.delete),
                    ],
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
