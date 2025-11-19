import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/pages/bookmark_page.dart';
import 'package:pas_mobile_11pplg2_01/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_01/pages/show_page.dart';

class BaseController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [ShowPage(), BookmarkPage(), ProfilePage()];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
