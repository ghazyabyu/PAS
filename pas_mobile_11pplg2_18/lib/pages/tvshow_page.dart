import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/controllers/tvshow_controller.dart';
import 'package:pas_mobile_11pplg2_18/controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_18/components/custom_card.dart';

class TvshowPage extends StatelessWidget {
  const TvshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TvshowController controller = Get.find<TvshowController>();
    final FavoriteController favCtrl = Get.find<FavoriteController>();

    return Scaffold(
      body: Obx(() {
        final _ = favCtrl.favorites;
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.tvshowslist.isEmpty) {
          return Center(
            child: Text(
              'Tidak ada produk',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.tvshowslist.length,
            itemBuilder: (context, index) {
              final item = controller.tvshowslist[index];
              return TvshowCard(
                key: ValueKey(item.id),
                tvshow: item,
                isFavorite: favCtrl.isFavoriteSync(item.id),
                onFavoriteChanged: (isFav) async {
                  await favCtrl.toggleFavorite(item);
                  if (isFav) {
                    Get.snackbar('Favorit', 'Ditambahkan ke favorit');
                  } else {
                    Get.snackbar('Favorit', 'Dihapus dari favorit');
                  }
                },
              );
            },
          ),
        );
      }),
    );
  }
}
