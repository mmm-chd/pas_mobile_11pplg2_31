import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/base/base_controller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BaseController baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.lightBlue,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        elevation: 1,
        selectedIndex: baseController.currentIndex.value,
        onDestinationSelected: (value) => baseController.changeIndex(value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.tv_rounded), label: 'Tv Show'),
          NavigationDestination(icon: Icon(Icons.bookmark), label: 'Bookmark'),
          NavigationDestination(icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}
