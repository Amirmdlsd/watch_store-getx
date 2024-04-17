import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/cached_image.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/main_button.dart';
import 'package:watch_store_getx/feature/feature_basket/controller/basket_controller.dart';
import 'package:watch_store_getx/feature/feature_product_detail/controller/product_detail_controller.dart';

import '../../../config/widget/discount_container_widget.dart';
import '../../../gen/assets.gen.dart';

class SingleProductDetailScreen extends StatefulWidget {
  const SingleProductDetailScreen({super.key});

  @override
  State<SingleProductDetailScreen> createState() =>
      _SingleProductDetailScreenState();
}

class _SingleProductDetailScreenState extends State<SingleProductDetailScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  final ProductDetailController controller = Get.put(ProductDetailController());
  final basketController = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppContainerAppBar(),
                      // image
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .3,
                        child: CachedImage(
                            imageUrl: controller.productDetaill.value.image!),
                      ),
                      AppDimens.medium.height,
                      // brand
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height * .02),
                        child: Text(
                          '${controller.productDetaill.value.brand}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      AppDimens.medium.height,
                      // title
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height * .02),
                        child: Text(
                          "${controller.productDetaill.value.title}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                      AppDimens.medium.height,
                      // tab bar
                      TabBar(controller: tabController, tabs: [
                        Tab(
                          child: Text(
                            'مشخصات',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Tab(
                            child: Text(
                          'نقدوبررسی',
                          style: Theme.of(context).textTheme.displayMedium,
                        )),
                        Tab(
                            child: Text(
                          'نظرات',
                          style: Theme.of(context).textTheme.displayMedium,
                        )),
                      ]),
                      AppDimens.medium.height,
                      //tab view
                      Container(
                        height: MediaQuery.of(context).size.height * .35,
                        width: double.infinity,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            //properties
                            ListView.builder(
                              itemCount: controller
                                  .productDetaill.value.properties!.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade400),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.productDetaill.value
                                        .properties![index].value!),
                                    Text(controller.productDetaill.value
                                        .properties![index].property!),
                                  ],
                                ),
                              ),
                            ),
                            //discussion
                            SingleChildScrollView(
                                child: HtmlWidget(
                              controller.productDetaill.value.discussion!,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 17),
                            )),
                            //comments
                            controller.productDetaill.value.comments!.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                          Icons.comments_disabled_outlined,
                                          size: 50),
                                      AppDimens.medium.height,
                                      const Text(
                                        'هیچ کامنتی برای محصول وجودندارد',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  )
                                : CommentListView(controller: controller)
                          ],
                        ),
                      ),
                    ],
                  ),
                  //
                  //price container
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ProductDetailPriceContainer(
                          basketController: basketController,
                          controller: controller)),
                ],
              ),
      )),
    );
  }
}

class ProductDetailPriceContainer extends StatelessWidget {
  const ProductDetailPriceContainer({
    super.key,
    required this.basketController,
    required this.controller,
  });

  final BasketController basketController;
  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            basketController.loading.value
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: const Center(child: LoadingWidget()))
                : SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 50,
                    child: MainElevatedButton(
                        bgColor: Colors.red,
                        fontSize: 13,
                        lable: AppStrings.addToBasket,
                        onTap: () {
                          debugPrint(
                              'id is ${controller.productDetaill.value.id}');
                          basketController
                              .addToBasket(controller.productDetaill.value.id!);
                        })),
            //discount container
            Visibility(
                visible: controller.productDetaill.value.discount! > 0,
                child: DiscountContainerWidget(
                    title: '${controller.productDetaill.value.discount}')),
            AppDimens.small.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${controller.productDetaill.value.discountPrice} تومان',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 17)),
                Visibility(
                    visible: controller.productDetaill.value.discount! > 0,
                    child: Text('${controller.productDetaill.value.price}',
                        style: Theme.of(context).textTheme.titleSmall))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommentListView extends StatelessWidget {
  const CommentListView({
    super.key,
    required this.controller,
  });

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.productDetaill.value.comments!.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(Assets.png.avatar.path),
            AppDimens.medium.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    controller.productDetaill.value.comments![index].user ??
                        'نامشخص',
                    style: Theme.of(context).textTheme.displayMedium),
                AppDimens.medium.height,
                Text(
                    controller.productDetaill.value.comments![index].body ??
                        'نامشخص',
                    style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppContainerAppBar extends StatelessWidget {
  const AppContainerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * .02),
      height: MediaQuery.of(context).size.height * .07,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow, offset: Offset(1, 2), blurRadius: 4)
          ],
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          color: AppColors.appbar),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(Assets.svg.close)),
          SvgPicture.asset(
            Assets.svg.basket,
            color: Colors.black,
            height: MediaQuery.of(context).size.height * .03,
          ),
        ],
      ),
    );
  }
}
