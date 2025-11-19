import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/helper/db_helper.dart';
import 'package:pas_mobile_11pplg2_18/models/tvshowmodel.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  final DBHelper _db = DBHelper();

  var favorites = <Tvshowmodel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    try {
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(Tvshowmodel tvshow) async {
    isLoading.value = true;
    try {
      await _db.insertFavorite(tvshow);
      
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan favorit: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFavorite(int tvshowid) async {
    isLoading.value = true;
    try {
      await _db.deleteFavorite(tvshowid);
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menghapus favorit: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleFavorite(Tvshowmodel tvshow) async {
    if (isFavoriteSync(tvshow.id)) {
      await removeFavorite(tvshow.id);
    } else {
      await addFavorite(tvshow);
    }
  }

  bool isFavoriteSync(int tvshowid) => favorites.any((e) => e.id == tvshowid);

  Future<bool> isFavorite(int tvshowid) async {
    final row = await _db.getFavoriteRowByProductId(tvshowid);
    return row != null;
  }
}
