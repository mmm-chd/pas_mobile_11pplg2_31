import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_01/controllers/show_controller.dart';

class ShowPage extends StatelessWidget {
  ShowPage({super.key});

  final ShowController showController = Get.find<ShowController>();
  final BookmarkController bookmarkController = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Obx(() {
          if (showController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (showController.showsList.isEmpty) {
            return const Center(child: MytextWidget(text: 'No TV Shows Found'));
          }

          return RefreshIndicator(
            onRefresh: () {
              return showController.fetchTvShows();
            },
            child: ListView.builder(
              itemCount: showController.showsList.length,
              itemBuilder: (context, index) {
                final tvShow = showController.showsList[index];

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
                                      text: tvShow.name,
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        showController.toggleBookmark(tvShow);
                                      },
                                      child: Icon(
                                        bookmarkController.isBookmarked(
                                              tvShow.id,
                                            )
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            bookmarkController.isBookmarked(
                                              tvShow.id,
                                            )
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
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
