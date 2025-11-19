import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_18/models/tvshowmodel.dart';

class TvshowController extends GetxController {
   var isLoading = true.obs;
  var tvshowslist = <Tvshowmodel>[].obs;

  static const String baseUrl = "https://api.tvmaze.com/shows";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        
        final tvshows = tvshowmodelFromJson(response.body);
        tvshowslist.assignAll(tvshows);
        Get.snackbar(
          'Berhasil',
          'Berhasil mengambil ${tvshowslist.length} tvshow',
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data tvshow: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data tvshow: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await fetchProducts();
  }
}