import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/modules/chats/views/chats_view.dart';
import 'package:my_trip/app/modules/favorites/views/favorites_view.dart';
import 'package:my_trip/app/modules/home/views/home_view.dart';
import 'package:my_trip/app/modules/profile/views/profile_view.dart';
import 'package:my_trip/app/modules/reservations/views/reservations_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomeView(),
              FavoritesView(),
              ReservationsView(),
              ChatsView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kPrimaryColor,
          selectedItemColor: kPrimaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.house), label: 'explore'.tr),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.heart), label: 'Favorites'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.suitcase),
                label: 'Reservations'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.chats), label: 'Chats'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.user), label: 'Profile'),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBarItem({required Widget icon, required String label}) {
  return BottomNavigationBarItem(icon: icon, label: label);
}
