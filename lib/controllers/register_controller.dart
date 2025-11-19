import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_01/api/api_register.dart';
import 'package:pas_mobile_11pplg2_01/models/register_model.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> register() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        email.isEmpty) {
      Get.snackbar(
        'Please Fill In',
        'Username, password, full name, and email cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (username.length < 6) {
      Get.snackbar(
        'Invalid Username',
        'Username must be at least 6 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Invalid Username');
      return;
    } else if (password.length < 8) {
      Get.snackbar(
        'Invalid Password',
        'Password must be at least 8 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Invalid Password');
      return;
    } else if (fullName.length < 6) {
      Get.snackbar(
        'Invalid Full Name',
        'Full Name must be at least 3 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Invalid Full Name');
      return;
    } else if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Invalid Email');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    final response = await http.post(
      Uri.parse('${ApiRegister.baseUrl}${ApiRegister.registerEndpoint}'),
      body: {
        'username': username,
        'password': password,
        'full_name': fullNameController.text.trim(),
        'email': emailController.text.trim(),
      },
    );

    try {
      if (response.statusCode == 200) {
        final loginData = registerModelFromJson(response.body);

        Get.snackbar('LOGIN STATUS', loginData.message);

        if (loginData.status) {
          print('Account Created Successfully');
          Get.snackbar('Success', 'Account Created Successfully');
          Get.offAllNamed(AppRoutes.loginPage);
        }
      }
    } catch (e) {
      final loginData = registerModelFromJson(response.body);
      Get.snackbar('LOGIN STATUS', loginData.message);
    } finally {
      isLoading.value = false;
    }
  }
}
