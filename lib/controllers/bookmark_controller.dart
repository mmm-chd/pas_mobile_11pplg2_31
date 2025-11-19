import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart';

class BookmarkController extends GetxController {
  var isLoading = false.obs;
  final DbHelper dbHelper = DbHelper();
  final ShowController showController = Get.find<ShowController>();
  final RxList<TvShowModel> bookmarkedShows = <TvShowModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchBookmarkedShows();
  }

  Future<void> fetchBookmarkedShows() async {
    bookmarkedShows.value = await showController.showsList
        .where((shows) => shows.isBookmarked)
        .toList();
  }

  void toogleBookmark(int tvShowId) async {
    final index = showController.showsList.indexWhere(
      (tvShow) => tvShow.id == tvShowId,
    );
    if (index != -1) {
      final currentStatus = showController.showsList[index].isBookmarked;
      showController.showsList[index].isBookmarked = !currentStatus;
      showController.showsList.refresh();
      if (showController.showsList[index].isBookmarked) {
        dbHelper.deleteById(showController.showsList[index].id);
      } else {
        dbHelper.insertBookmark(showController.showsList[index]);
      }
      dbHelper.printAllData();
    }
  }
}
