import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pas_mobile_11pplg2_18/bindings/binding.dart';
import 'package:pas_mobile_11pplg2_18/routes/pages.dart';
import 'package:pas_mobile_11pplg2_18/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginpage,
      getPages: AppPages.pages,
    );
  }
}
