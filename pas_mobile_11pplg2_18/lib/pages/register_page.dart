import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_18/components/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_18/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_18/routes/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: controller.usernameController,
                labelText: 'Username',
                hintText: 'Masukkan username Anda',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: controller.fullNameController,
                labelText: 'Nama Lengkap',
                hintText: 'Masukkan Nama Lengkap Anda',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: controller.emailController,
                labelText: 'Email',
                hintText: 'Masukkan email Anda',
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.passwordController,
                labelText: 'Password',
                hintText: 'Masukkan password Anda',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),

              Obx(() {
                return CustomButton(
                  text: 'Register',
                  onPressed: controller.register,
                  isLoading: controller.isLoading.value,
                  icon: Icons.login,
                  height: 54,
                );
              }),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.loginpage);
                },
                child: const Text('Sudah punya akun? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
