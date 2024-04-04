import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';

import '../../gen/assets.gen.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../constant/string.dart';


class AppSearchBar extends StatelessWidget {
   AppSearchBar({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: size.height * .06,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppDimens.large)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(1, 3),
                    blurRadius: 4)
              ]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.png.mainLogo.path),
              ),
            const  Spacer(),
            const  Text(AppStrings.searchProduct),
              AppDimens.small.width,
              SvgPicture.asset(Assets.svg.search),
              AppDimens.medium.width
            ],
          ),
        ),
      ),
    );
  }
}
