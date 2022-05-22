import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final ProfileController authController = Get.find();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (authController.isAuth()) {
        Get.to(Routes.DASHBOARD);
      }else{
        Get.to(Routes.LOGIN);

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppThemeColors.primaryPureWhite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text(
            'SplashView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
