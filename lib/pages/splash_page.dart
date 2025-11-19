import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.lightBlue, Colors.blueAccent],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white),
                MytextWidget(
                  text: 'Welcome',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
