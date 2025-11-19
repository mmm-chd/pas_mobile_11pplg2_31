import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myButton_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myTextField_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MytextfieldWidget(
              isNumber: false,
              label: 'Username',
              controller: registerController.usernameController,
            ),
            const MyspaceWidget(height: 16.0),
            MytextfieldWidget(
              isNumber: false,
              label: 'Password',
              controller: registerController.passwordController,
              obscureText: true,
            ),
            const MyspaceWidget(height: 16.0),
            MytextfieldWidget(
              isNumber: false,
              label: 'Full Name',
              controller: registerController.fullNameController,
              obscureText: false,
            ),
            const MyspaceWidget(height: 16.0),
            MytextfieldWidget(
              isNumber: false,
              label: 'Email',
              controller: registerController.emailController,
              obscureText: false,
            ),
            const MyspaceWidget(height: 16.0),
            MybuttonWidget(
              text: 'Create Account',
              onPressed: registerController.register,
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            const MyspaceWidget(height: 16.0),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.loginPage);
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
