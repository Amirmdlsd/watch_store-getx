import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/widget/category_item_chip.dart';
import '../controller/home_controller.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    super.key,
  });

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        height: size.height * .13,
        width: double.infinity,
        child: Obx(
          () => Center(
            child: ListView.builder(
              itemCount: homeController.categroyList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Center(
                child: CategoryItemChip(
                  size: size,
                  category: homeController.categroyList[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
