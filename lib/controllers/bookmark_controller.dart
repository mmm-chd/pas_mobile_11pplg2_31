import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart';

class BookmarkController extends GetxController {
  final dbHelper = DbHelper();

  var bookmarks = <TvShowModel>[].obs;
  final showController = Get.find<ShowController>();

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final data = await dbHelper.getList();
    for (var tv in data) {
      tv.isBookmarked = true;
    }
    bookmarks.assignAll(data);
    bookmarks.refresh();
  }

  Future<void> addBookmark(TvShowModel tvShow) async {
    await dbHelper.insertBookmark(tvShow);
    tvShow.isBookmarked = true;
    await loadBookmarks();
  }

  Future<void> removeBookmark(int id) async {
    await dbHelper.deleteById(id);

    // Update reactive state di showsList

    final show = showController.showsList.firstWhereOrNull((s) => s.id == id);
    if (show != null) {
      show.isBookmarked = false;
    }

    await loadBookmarks();
  }

  bool isBookmarked(int id) {
    return bookmarks.any((b) => b.id == id);
  }

  void deleteAll() async {
    dbHelper.deleteAllBookmarked();
    await loadBookmarks();
    print('Delete all!');
  }
}
