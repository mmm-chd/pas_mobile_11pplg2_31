import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // String? password = prefs.getString('password');

    await Future.delayed(Duration(seconds: 2));
    if (token != null) {
      Get.offAllNamed(AppRoutes.basePage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
