import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_getx/config/constant/color.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/constant/string.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/feature/feature_authentication/controller/auth_controller.dart';
import 'package:watch_store_getx/feature/feature_profile/controller/user_controller.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/route/named_class.dart';

import '../../../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final userController = Get.put(UserControllr());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => userController.loading.value
            ? const Center(child: LoadingWidget())
            : CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text(AppStrings.profile,
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: AppColors.appbar,
                    shadowColor: AppColors.shadow,
                    elevation: 3,
                    forceElevated: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        top: height * .03,
                        right: width * .06,
                        left: width * .06),
                    sliver: SliverToBoxAdapter(
                        child: Column(
                      children: [
                        // avatar
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                          width: width * .4,
                          child: CircleAvatar(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              Assets.png.avatar.path,
                              fit: BoxFit.cover,
                            ),
                          )),
                        ),
                        AppDimens.small.height,
                        Text(userController.user.value.name ?? '',
                            style: Theme.of(context).textTheme.displayMedium),
                        AppDimens.medium.height,
                        SizedBox(
                          height: height * .3,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserItem(
                                title:
                                    userController.user.value.phone.toString(),
                                image: Assets.svg.phone,
                              ),
                              AppDimens.medium.height,
                              UserItem(
                                title: userController.user.value.postalCode
                                    .toString(),
                                image: Assets.svg.postalCode,
                              ),
                              AppDimens.medium.height,
                              UserItem(
                                title:
                                    userController.user.value.name.toString(),
                                image: Assets.svg.user,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.logout,
                                      size: 30, color: Colors.black),
                                  TextButton(
                                      onPressed: () {
                                        AuthManager.removeToken();
                                        Get.offAndToNamed(
                                            NamedClass.sendSmsScreen);
                                        var user = Get.find<AuthController>();
                                        user.mobileController.text ='';
                                        user.verificationCodeContoller.text ='';
                                        user.postalCodeContoller.text ='';
                                        user.addressContoller.text ='';
                                        user.phoneContoller.text ='';
                                      },
                                      child: Text("خروج از حساب",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(fontSize: 16))),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ),
      )),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          width: 30,
          color: Colors.black,
        ),
        AppDimens.medium.width,
        Text(title,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16)),
      ],
    );
  }
}
