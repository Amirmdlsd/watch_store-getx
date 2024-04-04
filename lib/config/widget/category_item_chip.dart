import 'package:flutter/material.dart';

import '../../feature/feature_home/model/category_model.dart';
import 'cached_image.dart';


class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({
    super.key,
    required this.size, required this.category,
  });

  final Size size;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: size.height*.08,
            width: size.height*.09,
            child: CachedImage(imageUrl: category.image),
          ),
        ),
        Text(category.title,style: Theme.of(context).textTheme.labelMedium)
      ],),
    );
  }
}
