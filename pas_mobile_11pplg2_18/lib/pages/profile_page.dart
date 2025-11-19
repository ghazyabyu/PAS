import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_18/controllers/login_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),

              Obx(() {
                return Text(
                  controller.username.value.isNotEmpty
                      ? controller.username.value
                      : 'Ghazy abyu pandega',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                );
              }),
              const SizedBox(height: 40),
              
              CustomButton(
                text: 'Logout',
                onPressed: () {
                  _showLogoutDialog(context, controller);
                },
                backgroundColor: Colors.red,
                icon: Icons.logout,
                width: double.infinity,
                height: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, LoginController controller) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Batal', style: TextStyle(color: Colors.grey.shade600)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              controller.logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
