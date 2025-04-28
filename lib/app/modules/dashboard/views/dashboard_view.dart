import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../favourite/views/favourite_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                // CategoryView(),
                FavouriteView(),
                // CartView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //iconSize: 26,
            elevation: 8,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              bottomNavigationBarItem(icon: Icons.home, label: 'Home'),
              // bottomNavigationBarItem(icon: Icons.category, label: 'Category'),
              bottomNavigationBarItem(icon: Icons.favorite, label: 'Favourite'),
              // bottomNavigationBarItem(icon: Icons.shopping_cart, label: 'Cart'),
              bottomNavigationBarItem(
                icon: Icons.person_sharp,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
