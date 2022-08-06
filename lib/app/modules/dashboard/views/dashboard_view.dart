import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/chats/views/chats_view.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';
import 'package:my_trip/app/modules/favorites/views/favorites_view.dart';
import 'package:my_trip/app/modules/home/views/home_view.dart';
import 'package:my_trip/app/modules/profile/views/profile_view.dart';
import 'package:my_trip/app/modules/reservations/views/reservations_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final cityController = Get.find<CityDestinationsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              FavoritesView(),
              ReservationsView(),
              ChatsView(),
              ProfileView(),
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
                icon: const Icon(PhosphorIcons.house), label: 'اكتشف'),
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
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const UserAccountsDrawerHeader(
        //         decoration: BoxDecoration(color: AppThemeColors.grayPrimary400),
        //         currentAccountPicture: CircleAvatar(
        //           radius: 50.0,
        //           backgroundColor: Colors.white,
        //           child: Icon(
        //             PhosphorIcons.user,
        //             color: AppThemeColors.grayPrimary500,
        //           ),
        //         ),
        //         accountEmail: Text('hebaelosta98@gmail.com'),
        //         accountName: Text('Heba Elosta'),
        //       ),
        //       // ListTile(
        //       //   leading: const Icon(
        //       //     PhosphorIcons.user,
        //       //     color: AppThemeColors.grayPrimary500,
        //       //   ),
        //       //   title: DefaultText('بيانات حسابي'),
        //       //   onTap: () {
        //       //     Get.toNamed(Routes.PROFILE);
        //       //   },
        //       // ),
        //       ListTile(
        //         leading: const Icon(
        //           PhosphorIcons.article,
        //           color: AppThemeColors.grayPrimary500,
        //         ),
        //         title: const DefaultText('الاحكام و الشروط'),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           PhosphorIcons.info,
        //           color: AppThemeColors.grayPrimary500,
        //         ),
        //         title: const DefaultText(
        //           'معلومات عنا',
        //         ),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           PhosphorIcons.sign_out,
        //           color: AppThemeColors.grayPrimary500,
        //         ),
        //         title: const DefaultText('تسجيل الخروج'),
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: controller.showNotification,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ),
      );
    });
  }
}

_bottomNavigationBarItem({required Widget icon, required String label}) {
  return BottomNavigationBarItem(icon: icon, label: label);
}
