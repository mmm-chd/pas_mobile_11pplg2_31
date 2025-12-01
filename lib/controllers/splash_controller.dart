import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final DbHelper dbHelper = Get.put(DbHelper());

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await Future.delayed(Duration(seconds: 5));
    if (token != null) {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.basePage);
    } else {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
