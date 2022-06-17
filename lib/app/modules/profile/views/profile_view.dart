import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
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
        child: Form(
          key: controller.profileFormKey,
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
                child: const Icon(
                  PhosphorIcons.user,
                  color: AppThemeColors.primaryPureWhite,
                  size: 30,
                ),
              ),
              RoundedInputField(
                  hintText: 'الاسم',
                  controller: controller.nameController,
                  icon: const Icon(PhosphorIcons.user,
                      color: AppThemeColors.primaryColor),
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("First Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 3 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.nameController.text = value!;
                  },
                  onChanged: (v) {}),
              RoundedInputField(
                  hintText: 'البريد الالكتروني',
                  controller: controller.emailController,
                  validator: (value) {
                    // return controller.validateEmail(v!);
                    if (value!.isEmpty) {
                      return ("رجاءً قم بإدخال بريدك الإلكتروني");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("رجاءً قم بإدخال بريد إلكتروني صحيح");


                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.emailController.text = value!;
                  },
                  icon: const Icon(PhosphorIcons.envelope_simple,
                      color: AppThemeColors.primaryColor),
                  onChanged: (v) {}),
              RoundedButton(
                text: 'حفظ التعديلات',
                press: () {
                  controller.updateProfileNameAndEmail();
                },
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
              Obx(
                () => controller.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text(''),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
