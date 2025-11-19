import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_18/controllers/nav_controller.dart';
import 'package:pas_mobile_11pplg2_18/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/tvshow_page.dart';
import 'package:pas_mobile_11pplg2_18/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavController controller = Get.find<NavController>();

  final List<Widget> pages = [TvshowPage(), FavoritePage(), ProfilePage()];

  final List<String> pageTitles = const ["list TVshow", "Bookmark", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(pageTitles[controller.currentIndex.value])),
        backgroundColor: const Color.fromARGB(255, 214, 24, 244),
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.live_tv),
              label: 'TV Shows',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    return Obx(
      () => ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: controller.currentIndex.value == index,
        onTap: () {
          controller.changePage(index);
          Get.back();
        },
      ),
    );
  }
}
