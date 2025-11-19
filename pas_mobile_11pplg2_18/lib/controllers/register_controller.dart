import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_18/API/client_network.dart';
import 'package:pas_mobile_11pplg2_18/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  var username = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  Future<Map<String, dynamic>> register() async {
    final usernameText = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();

    if (usernameText.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi, tidak boleh ada yang kosong',
      );
    }

    final url = Uri.parse('${ClientNetwork.baseUrl}/register-user');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': usernameText,
          'password': password,
          'full_name': fullName,
          'email': email,
        },
      );

      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Body: ${response.body}');

      if (response.statusCode == 200) {
        Get.offAllNamed(AppRoutes.loginpage);
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', usernameText);

          username.value = usernameText;
          isLoggedIn.value = true;

          return {
            'success': true,
            'message': data['message'] ?? 'Registrasi berhasil',
          };
        }

        return {
          'success': false,
          'message': data['message'] ?? 'Registrasi gagal',
        };
      }

      return {
        'success': false,
        'message': 'Registrasi gagal (${response.statusCode})',
      };
    } catch (e) {
      return {'success': false, 'message': 'Terjadi kesalahan: $e'};
    }
  }
}