import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
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
              const ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppThemeColors.grayPrimary300,
          selectedItemColor: AppThemeColors.primaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.house), label: 'explore'.tr),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.heart), label: 'المفضلة'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.suitcase), label: 'حجوزاتي'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.chats), label: 'الدردشات'),
            _bottomNavigationBarItem(
                icon: const Icon(PhosphorIcons.user), label: 'حسابي'),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBarItem({required Widget icon, required String label}) {
  return BottomNavigationBarItem(icon: icon, label: label);
}
