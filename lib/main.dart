import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/send_sms_screen.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      getPages: getPage,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'dana'
      ),
      home: HomeScreen(),
    );
  }
}
