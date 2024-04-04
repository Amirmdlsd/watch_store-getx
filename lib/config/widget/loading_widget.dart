import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
          height: 60,
          child: LoadingIndicator(
              colors: [Colors.black],
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white,
              indicatorType: Indicator.ballPulseSync),
        ));
  }
}
