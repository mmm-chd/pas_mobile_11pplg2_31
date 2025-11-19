import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final BookmarkController bookmarkController = Get.find<BookmarkController>();

  final ShowController showController = Get.find<ShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        final bookmarks = bookmarkController.bookmarks;

        if (showController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (bookmarks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bookmark_border, size: 80, color: Colors.grey[400]),
                const SizedBox(height: 16),
                MytextWidget(
                  text: 'No Bookmarked Shows',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                MytextWidget(
                  text: 'Start bookmarking your favorite shows!',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final tvShow = bookmarks[index];

            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        tvShow.image.medium,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 150,
                            width: 100,
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey[500],
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 150,
                            width: 100,
                            color: Colors.grey[200],
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ),
                    const MyspaceWidget(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MytextWidget(
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  text: tvShow.name,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  bookmarkController.removeBookmark(tvShow.id);
                                },
                                child: Icon(
                                  bookmarkController.isBookmarked(tvShow.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      bookmarkController.isBookmarked(tvShow.id)
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                          const MyspaceWidget(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const MyspaceWidget(width: 4),
                              MytextWidget(
                                text: tvShow.rating.average != null
                                    ? '${tvShow.rating.average}'
                                    : 'N/A',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
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
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
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
        );
      }),
    );
  }
}
