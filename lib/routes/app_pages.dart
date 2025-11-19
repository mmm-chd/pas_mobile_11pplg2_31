import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/base/base_binding.dart';
import 'package:pas_mobile_11pplg2_01/base/base_page.dart';
import 'package:pas_mobile_11pplg2_01/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_01/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_01/bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_01/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_01/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_01/pages/show_page.dart';
import 'package:pas_mobile_11pplg2_01/pages/splash_page.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.basePage,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: AppRoutes.showPage,
      page: () => ShowPage(),
      binding: BaseBinding(),
    ),
  ];
}
