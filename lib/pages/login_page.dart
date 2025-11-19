import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myButton_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myTextField_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: AlignmentGeometry.bottomRight,
            colors: [Colors.blue, Colors.lightBlue, Colors.blueAccent],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14, top: 90, left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MytextWidget(
                      text: 'Go ahead and set up your account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const MyspaceWidget(height: 10),
                    MytextWidget(
                      text: 'Sign in-up to enjoy the app',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const MyspaceWidget(height: 34),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MytextWidget(
                              text: 'Username',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const MyspaceWidget(height: 10),
                            MytextfieldWidget(
                              isNumber: false,
                              label: 'Enter your username..',
                              controller: loginController.usernameController,
                            ),
                            const MyspaceWidget(height: 16.0),
                            MytextWidget(
                              text: 'Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const MyspaceWidget(height: 10),
                            MytextfieldWidget(
                              isNumber: false,
                              label: 'Enter your password..',
                              controller: loginController.passwordController,
                              obscureText: true,
                            ),
                            const MyspaceWidget(height: 16.0),

                            // FIXED: Tambah loading indicator
                          ],
                        ),
                        Column(
                          children: [
                            Obx(
                              () => MybuttonWidget(
                                text: loginController.isLoading.value
                                    ? 'Loading...'
                                    : 'Login',
                                onPressed: loginController.isLoading.value
                                    ? null
                                    : loginController.login,
                                backgroundColor: Colors.lightBlue,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            const MyspaceWidget(height: 34.0),
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.registerPage);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Register',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const MyspaceWidget(height: 64.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
