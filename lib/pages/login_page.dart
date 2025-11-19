import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myButton_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/mySpace_widget.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myTextField_widget.dart';
import 'package:pas_mobile_11pplg2_01/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MytextfieldWidget(
              isNumber: false,
              label: 'Username',
              controller: loginController.usernameController,
            ),
            const MyspaceWidget(height: 16.0),
            MytextfieldWidget(
              isNumber: false,
              label: 'Password',
              controller: loginController.passwordController,
            ),
            const MyspaceWidget(height: 16.0),
            MybuttonWidget(
              text: 'Login',
              onPressed: loginController.login,
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            const MyspaceWidget(height: 16.0),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.registerPage);
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
          ],
        ),
      ),
    );
  }
}
