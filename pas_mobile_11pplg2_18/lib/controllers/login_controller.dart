import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_18/API/client_network.dart';
import 'package:pas_mobile_11pplg2_18/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var username = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('username');

    if (name != null && name.isNotEmpty) {
      username.value = name;
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.mainpage); 
    } else {
      isLoggedIn.value = false;
      Get.offAllNamed(AppRoutes.loginpage); 
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username dan Password tidak boleh kosong');
      return;
    }

    isLoading.value = true;

    final url = Uri.parse("${ClientNetwork.baseUrl}/login");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": email, "password": password},
      );

      print("Status code: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', email);

          username.value = email;
          isLoggedIn.value = true;

          Get.snackbar(
            'Sukses',
            'Login berhasil',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          Get.offAllNamed(AppRoutes.mainpage);
        } else {
          Get.snackbar(
            'Gagal',
            data['message'] ?? 'Login gagal',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Login gagal (${response.statusCode})',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    username.value = '';
    isLoggedIn.value = false;

    Get.offAllNamed(AppRoutes.loginpage);
  }
}
