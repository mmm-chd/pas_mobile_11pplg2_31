import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/base/base_controller.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/bottom_nav.dart';

class BasePage extends StatelessWidget {
  BasePage({super.key});

  final baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: baseController.currentIndex.value,
          children: baseController.pages,
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
