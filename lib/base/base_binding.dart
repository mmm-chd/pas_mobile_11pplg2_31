import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/base/base_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<ShowController>(() => ShowController(), fenix: true);
    Get.lazyPut<BookmarkController>(() => BookmarkController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
