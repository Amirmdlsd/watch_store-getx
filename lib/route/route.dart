import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/get_otp_screen.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/register_screen.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/send_sms_screen.dart';
import 'package:watch_store_getx/feature/feature_basket/screen/basket_scren.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/feature/feature_home/screen/main_screen.dart';
import 'package:watch_store_getx/feature/feature_product_detail/screen/single_detail_product_screen.dart';
import 'package:watch_store_getx/feature/feature_product_list/screen/product_list_screen.dart';
import 'package:watch_store_getx/feature/feature_profile/screen/profile_screen.dart';
import 'package:watch_store_getx/route/named_class.dart';

import '../binding.dart';
import '../feature/feature_intro/screen/splash_screen.dart';

List<GetPage<dynamic>> getPage = [
  GetPage(name: NamedClass.root, page: () => const SplashScreen()),
  GetPage(name: NamedClass.sendSmsScreen, page: () => SendSmsScree()),
  GetPage(name: NamedClass.getOtpScreen, page: () => GetOtpScreen()),
  GetPage(name: NamedClass.registerScreen, page: () => RegisterScreen()),
  GetPage(name: NamedClass.mainScreen, page: () => MainScreen()),
  GetPage(name: NamedClass.homeScreen, page: () => HomeScreen()),
  GetPage(
      name: NamedClass.singleProductDetail,
      page: () => const SingleProductDetailScreen()),
  GetPage(name: NamedClass.basketScreen, page: () => BasketScreen()),
  GetPage(name: NamedClass.productListScreen, page: () => ProductListScreen()),
  GetPage(
      name: NamedClass.profileScreen,
      page: () => ProfileScreen(),
      binding: UserBinding()),
];
