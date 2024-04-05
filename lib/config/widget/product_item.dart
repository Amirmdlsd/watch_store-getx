import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/extension/timer_extension.dart';
import 'package:watch_store_getx/config/widget/discount_container_widget.dart';
import 'package:watch_store_getx/feature/feature_product_detail/controller/product_detail_controller.dart';

import '../../feature/feature_home/model/product_model.dart';

import '../constant/color.dart';
import 'cached_image.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Timer timer;
  DateTime time = DateTime.now();
  RxInt timeInSeconds = 0.obs;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeInSeconds.value > 0) {
        timeInSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    String productTime = widget.product.specialExpiration!;
    Duration dif = time.difference(DateTime.parse(productTime)).abs();
    timeInSeconds.value = dif.inSeconds;

    super.initState();
    startTimer();
  }

  var detailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Obx(
      () => GestureDetector(
        onTap: () async {
          await detailController.getProductDetail(widget.product.id!);
        },
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),
            width: size.width * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.medium),
              gradient: const LinearGradient(
                  colors: AppColors.productBgGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: size.height * .1,
                      child: CachedImage(imageUrl: widget.product.image!)),
                  AppDimens.medium.height,
                  Text(widget.product.title!,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2),
                  AppDimens.medium.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DiscountContainerWidget(
                          title: '${widget.product.discount}'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.product.discountPrice} تومان',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 17)),
                          Text('${widget.product.price}',
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      )
                    ],
                  ),
                  AppDimens.large.height,
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: AppColors.primaryColor,
                  ),
                  AppDimens.medium.height,
                  Text(
                    timeInSeconds.formatTimer(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
