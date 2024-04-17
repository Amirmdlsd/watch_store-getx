import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/feature/feature_home/controller/home_controller.dart';

import '../../gen/assets.gen.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../constant/string.dart';

class AppSearchBar extends StatelessWidget {
  AppSearchBar({
    super.key,
  });

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController searchText = TextEditingController();

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: 10),
      sliver: SliverToBoxAdapter(
          child: TypeAheadField(
        builder: (context, controller, focusNode) {
          return Container(
            width: double.infinity,
            height: size.height * .06,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppDimens.large)),
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
                Expanded(
                    child: TextField(
                        onSubmitted: (value) {
                          homeController.search(searchText.text);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: 'دنبال چی میگردی؟',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(Assets.svg.search,
                                color: Colors.black),
                          ),
                        ))),
                AppDimens.small.width
              ],
            ),
          );
        },
        itemBuilder: (BuildContext context, value) {
          return Obx(
            () => ListView.builder(
              itemBuilder: (context, index) {
                return Text(homeController.searchproduct[index].title!);
              },
            ),
          );
        },
        onSelected: (Object? value) {},
        suggestionsCallback: (String search) async {
          await homeController.search(search);
        },
      )),
    );
  }
}
