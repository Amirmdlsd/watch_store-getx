import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';


class DiscountContainerWidget extends StatelessWidget {
  const DiscountContainerWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.height * .01),
      height: size.height * .03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.medium),
          color: Colors.red),
      child: Center(
          child: Text(
        '$title%',
        style: Theme.of(context).textTheme.bodyMedium,
      )),
    );
  }
}
