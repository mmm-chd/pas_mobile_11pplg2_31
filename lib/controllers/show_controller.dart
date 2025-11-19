import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_01/api/api_tvshow.dart';
import 'package:pas_mobile_11pplg2_01/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart';

class ShowController extends GetxController {
  var isLoading = false.obs;
  var showsList = <TvShowModel>[].obs;
  final dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchTvShows();
  }

  Future<void> fetchTvShows() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('${ApiTvshow.baseUrl}${ApiTvshow.showsEndpoint}'),
      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = tvShowModelFromJson(
          response.body,
        ); // harus List<ProductModel>
        showsList.assignAll(data);
      } else {
        Get.snackbar('Error', 'Message error from server');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toogleBookmark(int tvShowId) {
    final index = showsList.indexWhere((tvShow) => tvShow.id == tvShowId);
    if (index != -1) {
      final currentStatus = showsList[index].isBookmarked;
      showsList[index].isBookmarked = !currentStatus;
      showsList.refresh();
      if (showsList[index].isBookmarked) {
        dbHelper.insertBookmark(showsList[index]);
      } else {
        dbHelper.deleteById(showsList[index].id);
      }
      dbHelper.printAllData();
    }
  }
}
