import 'package:get/get.dart';
import 'package:watch_store_getx/feature/feature_profile/controller/user_controller.dart';
class UserBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(UserControllr());
  }

}
