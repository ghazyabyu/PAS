import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final splashC = Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 33, 194),
      body: Center(child: Container(
        child:  Text("Splash Screen", style: TextStyle(
          fontSize: 20,
          color: Colors.white,
         ),
       ),),
      )
    );
  }
}