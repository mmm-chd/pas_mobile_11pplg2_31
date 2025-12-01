import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myPopUpMenuButton_widget.dart';
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
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 18),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.transparent,
              floating: true,
              title: MytextWidget(
                text: 'My Bookmark',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              actions: [
                MypopupmenubuttonWidget(onTap: () {}, text: 'Delete All'),
              ],
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(left: 14, right: 14),
              sliver: Obx(() {
                final bookmarks = bookmarkController.bookmarks;

                // Loading state
                if (showController.isLoading.value) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                // Empty state
                if (bookmarks.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 80,
                            color: Colors.grey,
                          ),
                          MyspaceWidget(height: 16),
                          MytextWidget(
                            text: 'No Bookmarked Shows',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          MyspaceWidget(height: 8),
                          MytextWidget(
                            text: 'Start bookmarking your favorite shows!',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // Main list
                return SliverList.builder(
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final tvShow = bookmarks[index];

                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8),
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
                              ),
                            ),
                            MyspaceWidget(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          tvShow.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => bookmarkController
                                            .removeBookmark(tvShow.id),
                                        child: Icon(
                                          bookmarkController.isBookmarked(
                                                tvShow.id,
                                              )
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 28,
                                          color:
                                              bookmarkController.isBookmarked(
                                                tvShow.id,
                                              )
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyspaceWidget(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      MyspaceWidget(width: 4),
                                      Text(
                                        tvShow.rating.average?.toString() ??
                                            'N/A',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyspaceWidget(height: 8),
                                  Text(
                                    tvShow.summary.replaceAll(
                                      RegExp(r'<[^>]*>'),
                                      '',
                                    ),
                                    maxLines: 4,
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
            ),
          ],
        ),
      ),
    );
  }
}
