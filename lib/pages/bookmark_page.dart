import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart' hide Image;

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final BookmarkController bookmarkController = Get.find<BookmarkController>();
  final ShowController showController = Get.find<ShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          final List<TvShowModel> bookmarks = showController.showsList
              .where((p) => p.isBookmarked)
              .toList();
          if (showController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (bookmarkController.bookmarkedShows.isEmpty) {
            return const Center(child: MytextWidget(text: 'Bookmark is Empty'));
          }

          return RefreshIndicator(
            onRefresh: () {
              return showController.fetchTvShows();
            },
            child: ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final tvShow = bookmarks[index];

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            tvShow.image?.medium ?? '',
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const MyspaceWidget(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: MytextWidget(
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      text: '${tvShow.name}',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      bookmarkController.toogleBookmark(
                                        tvShow.id,
                                      );
                                    },
                                    child: Icon(
                                      tvShow.isBookmarked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: tvShow.isBookmarked
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const MyspaceWidget(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      const MyspaceWidget(width: 4),
                                      MytextWidget(
                                        text: '${tvShow.rating.average}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const MyspaceWidget(height: 8),
                              MytextWidget(
                                maxLines: 4,
                                text: tvShow.summary.replaceAll(
                                  RegExp(r'<[^>]*>'),
                                  '',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
