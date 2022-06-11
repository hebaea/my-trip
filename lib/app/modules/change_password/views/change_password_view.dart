import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SvgPicture.asset(
                "assets/images/change_password.svg",
                height: 110.h,
                width: 120.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              RoundedInputField(
                  hintText: 'كلمة المرور القديمة',
                  icon: Icon(PhosphorIcons.lock,
                      color: AppThemeColors.primaryColor),
                  onChanged: (v) {}),
              RoundedInputField(
                  hintText: 'كلمة المرور الجديدة',
                  icon: Icon(PhosphorIcons.lock,
                      color: AppThemeColors.primaryColor),
                  onChanged: (v) {}),
              RoundedButton(
                text: 'حفظ',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
