import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../feature/feature_home/controller/home_controller.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import 'cached_image.dart';

class AppBannerSlider extends StatelessWidget {
  AppBannerSlider({
    super.key,
  });

  final homeController = Get.put(HomeController());

  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverPadding(
      sliver: SliverToBoxAdapter(
        child: SizedBox(
            width: double.infinity,
            height: size.height * .25,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size.height * .2,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: homeController.bannerList.length,
                    itemBuilder: (context, index) {
                      debugPrint(
                          'image is ${homeController.bannerList[index].image}');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimens.medium),
                          child: CachedImage(
                              imageUrl: homeController.bannerList[index].image),
                        ),
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                        dotColor: AppColors.primaryColor,
                        dotHeight: 15,
                        dotWidth: 15),
                    controller: pageController,
                    count: homeController.bannerList.length)
              ],
            )),
      ),
      padding: EdgeInsets.only(top: size.height * .01),
    );
  }
}
