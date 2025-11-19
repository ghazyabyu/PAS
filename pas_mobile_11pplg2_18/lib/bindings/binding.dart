import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/nav_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/splash_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/tvshow_controller.dart';

class allbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<NavController>(() => NavController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<TvshowController>(() => TvshowController());
    Get.lazyPut<SplashController>(() => SplashController());
  }

}
