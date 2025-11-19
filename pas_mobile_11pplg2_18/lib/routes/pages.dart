
import 'package:pas_mobile_11pplg2_18/bindings/binding.dart';
import 'package:pas_mobile_11pplg2_18/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/main_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/tvshow_page.dart';
import 'package:pas_mobile_11pplg2_18/routes/routes.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/widgets.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginpage, page: () => LoginPage(), binding: allbinding()),
    GetPage(name: AppRoutes.registerpage, page: () => RegisterPage(), binding: allbinding()),
    GetPage(name: AppRoutes.mainpage, page: () => MainPage(), binding: allbinding()),
    GetPage(name: AppRoutes.tvshowpage, page: () => TvshowPage(), binding: allbinding()),
    GetPage(name: AppRoutes.favoritepage, page: () => FavoritePage(), binding: allbinding()),
    GetPage(name: AppRoutes.profilepage, page: () => ProfilePage(), binding: allbinding()),
   
  ];
}
