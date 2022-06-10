import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyLocaleController langController = Get.find();
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 10.h,
            ),
            CircleAvatar(
              radius: 50.0.r,
              backgroundColor: AppThemeColors.primaryColor,
              child: Icon(
                PhosphorIcons.user,
                color: AppThemeColors.primaryPureWhite,
                size: 30,
              ),
            ),
            RoundedInputField(
                hintText: 'الاسم',
                icon: Icon(PhosphorIcons.user,
                    color: AppThemeColors.primaryColor),
                onChanged: (v) {}),
            RoundedInputField(
                hintText: 'البريد الالكتروني',
                icon: Icon(PhosphorIcons.envelope_simple,
                    color: AppThemeColors.primaryColor),
                onChanged: (v) {}),
            RoundedButton(
              text: 'حفظ التعديلات',
              press: () {},
            ),
            RoundedButton(
              text: 'تغيير كلمة المرور',
              press: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),

            RoundedButton(
              press: () {
                controller.doLogout();
              },
              text: 'تسجيل الخروج',
            ),
          ],
        ),
      ),
    ));
  }
}
