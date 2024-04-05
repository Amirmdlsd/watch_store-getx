import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/get_otp_screen.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/send_sms_screen.dart';
import 'package:watch_store_getx/feature/feature_basket/screen/basket_scren.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/feature/feature_home/screen/main_screen.dart';
import 'package:watch_store_getx/feature/feature_product_detail/screen/single_detail_product_screen.dart';
import 'package:watch_store_getx/route/named_class.dart';

List<GetPage<dynamic>> getPage = [
  GetPage(name: NamedClass.sendSmsScreen, page: () => SendSmsScree()),
  GetPage(name: NamedClass.getOtpScreen, page: () => GetOtpScreen()),
  GetPage(name: NamedClass.mainScreen, page: () => MainScreen()),
  GetPage(name: NamedClass.homeScreen, page: () => HomeScreen()),
  GetPage(
      name: NamedClass.singleProductDetail,
      page: () => SingleProductDetailScreen()),
  GetPage(name: NamedClass.basketScreen, page: () => BasketScreen()),
];
