import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_18/components/custom_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find<FavoriteController>();
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.favorites.isEmpty) {
          return Center(
            child: Text(
              'Belum ada favorit',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return TvshowCard(
              key: ValueKey(item.id),
              tvshow: item,
              isFavorite: controller.isFavoriteSync(item.id),
              onFavoriteChanged: (isFav) async {
                await controller.toggleFavorite(item);
              },
            );
          },
        );
      }),
    );
  }
}
