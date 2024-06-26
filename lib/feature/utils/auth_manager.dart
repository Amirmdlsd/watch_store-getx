import 'package:get_storage/get_storage.dart';

class AuthManager {
  static GetStorage box = GetStorage();

  static saveToken(String token) async {
    await box.write('token', token);
  }

  static String readToken() {
    return box.read('token') ?? "";
  }

  static void removeToken() {
    box.remove('token');
  }
}
