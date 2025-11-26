import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart';

class BookmarkController extends GetxController {
  final dbHelper = DbHelper();

  var bookmarks = <TvShowModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final data = await dbHelper.getList();
    for (var tv in data) {
      tv.isBookmarkedRx.value = true; // penting!
    }
    bookmarks.assignAll(data);
    bookmarks.refresh();
  }

  Future<void> addBookmark(TvShowModel tvShow) async {
    await dbHelper.insertBookmark(tvShow);
    tvShow.isBookmarkedRx.value = true; // ✅ Update reactive state
    await loadBookmarks();
  }

  Future<void> removeBookmark(int id) async {
    await dbHelper.deleteById(id);

    // Update reactive state di showsList
    final showController = Get.find<ShowController>();
    final show = showController.showsList.firstWhereOrNull((s) => s.id == id);
    if (show != null) {
      show.isBookmarkedRx.value = false; // ✅ Update reactive state
    }

    await loadBookmarks();
  }

  bool isBookmarked(int id) {
    return bookmarks.any((b) => b.id == id);
  }
}
