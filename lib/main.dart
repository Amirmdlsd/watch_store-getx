import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/send_sms_screen.dart';
import 'package:watch_store_getx/feature/feature_basket/screen/basket_scren.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/feature/feature_home/screen/main_screen.dart';
import 'package:watch_store_getx/route/route.dart';

void main()async {
 await GetStorage.init();
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
        textTheme: TextTheme(
            displayMedium:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            labelMedium:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            bodyMedium: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            titleSmall: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.grey.shade400,
                decorationThickness: 2,
                color: Colors.grey)),
      ),
      home: MainScreen(),
    );
  }
}
