import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimens.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {super.key,
      required this.lable,
      required this.onTap,
      this.bgColor = AppColors.primaryColor,
      this.fontSize = 16});

  final String lable;
  final Function() onTap;
  final Color bgColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .07),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.medium)),
              minimumSize: Size(double.infinity, size.height * .07),
              backgroundColor: bgColor),
          child: Text(lable,
              style:  TextStyle(
                  color: Colors.white, fontSize: fontSize, fontFamily: 'dm'))),
    );
  }
}
