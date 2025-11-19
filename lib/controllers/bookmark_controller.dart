import 'package:get/get.dart';
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
  }

  Future<void> addBookmark(TvShowModel tvShow) async {
    await dbHelper.insertBookmark(tvShow);
    await loadBookmarks();
  }

  Future<void> removeBookmark(int id) async {
    await dbHelper.deleteById(id);
    await loadBookmarks();
  }

  bool isBookmarked(int id) {
    return bookmarks.any((b) => b.id == id);
  }
}
