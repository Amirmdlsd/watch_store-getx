import 'package:flutter/material.dart';
import 'package:watch_store_getx/config/extension/sized_box_extension.dart';
import 'package:watch_store_getx/config/extension/timer_extension.dart';

import '../constant/dimens.dart';
import 'package:get/get.dart';


class MainInputWidget extends StatelessWidget {
   MainInputWidget({
    super.key,
    required this.lable,
    required this.hintText,
    required this.textInputType,
    required this.controller,this.time,  this.showTimer=false
  });

  final String lable;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  RxInt ?time;
  final bool showTimer;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(lable,
                  style:const TextStyle(
                      fontFamily: 'dm', fontSize: 16, fontWeight: FontWeight.bold)),
           Visibility(
             visible:showTimer==true,
             child: Text(time!.formatTimer(),style:const TextStyle(
                 fontFamily: 'dm', fontSize: 16, fontWeight: FontWeight.bold)),
           )
            ],
          ),
          AppDimens.small.height,
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: textInputType,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                )),
          ),
        ],
      ),
    );
  }
}
