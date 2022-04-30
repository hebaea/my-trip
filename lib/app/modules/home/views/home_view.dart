import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/modules/chats/views/chats_view.dart';
import 'package:my_trip/app/modules/favorites/views/favorites_view.dart';
import 'package:my_trip/app/modules/profile/views/profile_view.dart';
import 'package:my_trip/app/modules/reservations/views/reservations_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              FavoritesView(),
              ReservationsView(),
              ChatsView(),
              ProfileView()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kPrimaryLightColor,
          selectedItemColor: kPrimaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(icon: Icons.home, label: 'home'),
            _bottomNavigationBarItem(icon: Icons.home, label: 'home'),
            _bottomNavigationBarItem(icon: Icons.home, label: 'home'),
            _bottomNavigationBarItem(icon: Icons.home, label: 'home'),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
