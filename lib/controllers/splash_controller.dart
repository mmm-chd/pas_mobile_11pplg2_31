import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final DbHelper dbHelper = Get.put(DbHelper());

  final BookmarkController bookmarkController = Get.put(BookmarkController());

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await Future.delayed(Duration(seconds: 2));
    if (token != null) {
      Get.offAllNamed(AppRoutes.basePage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
