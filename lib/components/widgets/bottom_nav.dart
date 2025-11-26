import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/base/base_controller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BaseController baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: baseController.pages[baseController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: baseController.currentIndex.value,
          onTap: baseController.changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie, color: Colors.grey),
              activeIcon: Icon(Icons.movie, color: Colors.lightBlue),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: Colors.grey),
              activeIcon: Icon(Icons.bookmark, color: Colors.lightBlue),
              label: "History",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              activeIcon: Icon(Icons.person, color: Colors.lightBlue),
              label: "Profile",
            ),
          ],

          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.lightBlue,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Obx(
  //     () => NavigationBar(
  //       indicatorColor: Colors.transparent,
  //       backgroundColor: Colors.lightBlue,
  //       labelTextStyle: WidgetStateProperty.all(
  //         TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
  //       ),
  //       elevation: 1,
  //       selectedIndex: baseController.currentIndex.value,
  //       onDestinationSelected: (value) => baseController.changeIndex(value),
  //       destinations: const [
  //         NavigationDestination(icon: Icon(Icons.tv_rounded), label: 'Tv Show'),
  //         NavigationDestination(icon: Icon(Icons.bookmark), label: 'Bookmark'),
  //         NavigationDestination(icon: Icon(Icons.person), label: 'My Profile'),
  //       ],
  //     ),
  //   );
  // }
}
