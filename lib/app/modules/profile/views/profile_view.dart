import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyLocaleController langController = Get.find();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // RoundedButton(
            //   press: () {
            //     langController.changeLang("ar");
            //   },
            //   text: 'arabic'.tr,
            // ),
            // RoundedButton(
            //   press: () {
            //     langController.changeLang("en");
            //   },
            //   text: 'english'.tr,
            // ),
            RoundedButton(
              press: () {
                controller.doLogout();
              },
              text: 'تسجيل الخروج',
            ),
          ],
        ));
  }
}
