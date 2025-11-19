import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
