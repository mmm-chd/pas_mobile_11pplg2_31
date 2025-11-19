import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myButton_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myTextField_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController registerController = Get.find<RegisterController>();

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

          SafeArea(
            child: CustomScrollView(
              slivers: [
                // HEADER
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 14,
                      top: 90,
                      left: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MytextWidget(
                          text: 'Go ahead and set up your account',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const MyspaceWidget(height: 10),
                        MytextWidget(
                          text: 'Sign up to enjoy the app',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //WHITE CARD
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const MyspaceWidget(height: 34),

                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Username
                                  MytextWidget(
                                    text: 'Username',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const MyspaceWidget(height: 10),
                                  MytextfieldWidget(
                                    isNumber: false,
                                    label: 'Enter your username..',
                                    controller:
                                        registerController.usernameController,
                                  ),
                                  const MyspaceWidget(height: 16),

                                  // Password
                                  MytextWidget(
                                    text: 'Password',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const MyspaceWidget(height: 10),
                                  MytextfieldWidget(
                                    isNumber: false,
                                    label: 'Enter your password..',
                                    controller:
                                        registerController.passwordController,
                                    obscureText: true,
                                  ),
                                  const MyspaceWidget(height: 16),

                                  // Fullname
                                  MytextWidget(
                                    text: 'Fullname',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const MyspaceWidget(height: 10),
                                  MytextfieldWidget(
                                    isNumber: false,
                                    label: 'Enter your fullname..',
                                    controller:
                                        registerController.fullNameController,
                                  ),
                                  const MyspaceWidget(height: 16),

                                  // Email
                                  MytextWidget(
                                    text: 'Email',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const MyspaceWidget(height: 10),
                                  MytextfieldWidget(
                                    isNumber: false,
                                    label: 'Enter your email..',
                                    controller:
                                        registerController.emailController,
                                  ),
                                  const MyspaceWidget(height: 24),

                                  //REGISTER BUTTON
                                  Obx(
                                    () => MybuttonWidget(
                                      text: registerController.isLoading.value
                                          ? 'Loading...'
                                          : 'Register',
                                      onPressed:
                                          registerController.isLoading.value
                                          ? null
                                          : registerController.register,
                                      backgroundColor: Colors.lightBlue,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),

                                  const MyspaceWidget(height: 34),

                                  //NAVIGASI KE LOGIN
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.offAllNamed(AppRoutes.loginPage);
                                      },
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                          text: "Already have an account? ",
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: 'Login',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const MyspaceWidget(height: 64),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
