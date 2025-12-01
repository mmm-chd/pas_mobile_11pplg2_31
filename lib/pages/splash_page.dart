import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pas_mobile_11pplg2_01/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white],
              ),
            ),
          ),
          Center(
            child: splashController.isLoading.value
                ? LottieBuilder.asset(
                    "assets/animations/load.json",
                    frameRate: FrameRate(30),
                    backgroundLoading: false,
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
