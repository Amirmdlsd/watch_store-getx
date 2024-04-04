import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/get_otp_screen.dart';
import 'package:watch_store_getx/feature/feature_authentication/screen/send_sms_screen.dart';
import 'package:watch_store_getx/feature/feature_home/screen/home_screen.dart';
import 'package:watch_store_getx/route/named_class.dart';

List<GetPage<dynamic>> getPage = [
  GetPage(name: NamedClass.sendSmsScreen, page: () => SendSmsScree()),
  GetPage(name: NamedClass.getOtpScreen, page: () => GetOtpScreen()),
  GetPage(name: NamedClass.homeScreen, page: () => HomeScreen())
,];
