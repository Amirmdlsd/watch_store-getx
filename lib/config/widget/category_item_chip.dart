import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/widget/product_item.dart';
import 'package:watch_store_getx/feature/feature_product_list/controller/controller.dart';

import '../../feature/feature_home/model/category_model.dart';
import 'cached_image.dart';

import 'package:get/get.dart';

class CategoryItemChip extends StatelessWidget {
   CategoryItemChip({
    super.key,
    required this.size,
    required this.category,
  });

  final Size size;
  final CategoryModel category;
  final productController = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        productController.getProduct(category.id);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * .08,
                width: size.height * .09,
                child: CachedImage(imageUrl: category.image),
              ),
            ),
            Text(category.title, style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
  }
}
