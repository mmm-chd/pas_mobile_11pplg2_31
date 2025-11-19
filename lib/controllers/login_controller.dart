import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_01/api/api_login.dart';
import 'package:pas_mobile_11pplg2_01/models/login_model.dart';
import 'package:pas_mobile_11pplg2_01/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Please Fill In',
        'Username and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    final response = await http.post(
      Uri.parse('${ApiLogin.baseUrl}${ApiLogin.loginEndpoint}'),
      body: {'username': username, 'password': password},
    );

    try {
      if (response.statusCode == 200) {
        final loginData = loginModelFromJson(response.body);

        Get.snackbar('LOGIN STATUS', loginData.message);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginData.token.toString());

        if (loginData.status) {
          print('Login Successful');
          Get.snackbar('Success', 'Login Successful');
          Get.offAllNamed(AppRoutes.basePage);
        }
      }
    } catch (e) {
      final loginData = loginModelFromJson(response.body);
      Get.snackbar('LOGIN STATUS', loginData.message);
    } finally {
      isLoading.value = false;
    }
  }
}
