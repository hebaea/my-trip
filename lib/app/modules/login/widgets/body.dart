import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/already_have_an_account_acheck.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/global_widgets/rounded_password_field.dart';
import 'package:my_trip/app/modules/login/controllers/login_controller.dart';
import 'package:my_trip/app/modules/register/views/register_view.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03.h),
              const DefaultText("تسجيل الدخول", fontWeight: FontWeight.bold),
              SizedBox(height: size.height * 0.03.h),
              SizedBox(
                width: 200.w,
                height: 200.h,
                child: SvgPicture.asset(
                  "assets/images/login.svg",
                  height: size.height * 0.35.h,
                ),
              ),
              SizedBox(height: size.height * 0.03.h),
              RoundedInputField(
                keyboardType: TextInputType.emailAddress,
                hintText: "البريد الالكتروني",
                onChanged: (value) {},
                icon: const Icon(PhosphorIcons.envelope_simple,
                    color: AppThemeColors.primaryColor),
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "تسجيل الدخول",
                press: () {
                  // controller.loginPressed();
                },
              ),
              SizedBox(height: size.height * 0.03.h),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Get.to(() =>  RegisterView());
                },
              ),
              SizedBox(height: size.height * 0.03.h),
            ],
          ),
        ),
      ),
    );
  }
}
