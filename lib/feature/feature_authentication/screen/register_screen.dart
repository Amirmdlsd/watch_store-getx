import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_getx/config/constant/dimens.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/widget/loading_widget.dart';
import 'package:watch_store_getx/config/widget/main_button.dart';
import 'package:watch_store_getx/config/widget/main_input_widget.dart';
import 'package:watch_store_getx/feature/utils/image_handler.dart';

import '../../../config/constant/string.dart';
import '../../../gen/assets.gen.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImageHandler imageHandler = ImageHandler();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
            child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserImagePicker(imageHandler: imageHandler),
              AppDimens.xLarge.height,
              MainInputWidget(
                lable: AppStrings.nameLastName,
                hintText: AppStrings.hintNameLastName,
                textInputType: TextInputType.text,
                controller: controller.nameContoller,
                time: 0.obs,
                showTimer: false,
              ),
              AppDimens.medium.height,
              MainInputWidget(
                lable: AppStrings.homeNumber,
                hintText: AppStrings.hintHomeNumber,
                textInputType: TextInputType.text,
                controller: controller.phoneContoller,
                time: 0.obs,
                showTimer: false,
              ),
              AppDimens.medium.height,
              MainInputWidget(
                lable: AppStrings.postalCode,
                hintText: AppStrings.hintPostalCode,
                textInputType: TextInputType.text,
                controller: controller.postalCodeContoller,
                time: 0.obs,
                showTimer: false,
              ),
              AppDimens.medium.height,
              MainInputWidget(
                lable: AppStrings.address,
                hintText: AppStrings.hintAddress,
                textInputType: TextInputType.text,
                controller: controller.addressContoller,
                time: 0.obs,
                showTimer: false,
              ),
              AppDimens.large.height,
              controller.loadingForRegister.value
                  ? const LoadingWidget()
                  : MainElevatedButton(
                      lable: AppStrings.register,
                      onTap: () {
                        controller.register(
                            image: imageHandler.getFile.path,
                            lat: 22.3,
                            lng: 30.25);
                      })
            ],
          ),
        )),
      )),
    );
  }
}

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.imageHandler});

  final ImageHandler imageHandler;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: SizedBox(
              height: height * .1,
              width: width * .2,
              child: widget.imageHandler.getFile.path.isEmpty
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        Assets.svg.avatar,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        File(widget.imageHandler.getFile.path),
                        fit: BoxFit.cover,
                      ))),
        ),
        //
        GestureDetector(
          onTap: () {
            Get.bottomSheet(Container(
              height: height * .2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image),
                  TextButton(
                      onPressed: () {
                        widget.imageHandler
                            .pickAndCropImage(imageSource: ImageSource.gallery)
                            .then((value) => setState(() {}));
                      },
                      child: Text('از گالری',
                          style: Theme.of(context).textTheme.labelMedium)),
                  SizedBox(width: width * .04),
                  const Icon(Icons.camera),
                  TextButton(
                      onPressed: () {
                        widget.imageHandler
                            .pickAndCropImage(imageSource: ImageSource.camera)
                            .then((value) => setState(() {}));
                      },
                      child: Text('از دوربین',
                          style: Theme.of(context).textTheme.labelMedium))
                ],
              ),
            ));
          },
          child: Text('انتخاب عکس',
              style: Theme.of(context).textTheme.labelMedium),
        )
      ],
    );
  }
}
