import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/already_have_an_account_acheck.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/global_widgets/rounded_password_field.dart';
import 'package:my_trip/app/modules/home/views/home_view.dart';
import 'package:my_trip/app/modules/login/views/login_view.dart';
import 'package:my_trip/app/modules/register/widgets/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03.h),
              const DefaultText(
                "تسجيل حساب جديد",
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.03.h),
              SizedBox(
                height: 250.h,
                width: 250.w,
                child: SvgPicture.asset(
                  "assets/images/register.svg",
                  height: size.height * 0.35.h,
                ),
              ),
              RoundedInputField(
                hintText: "الاسم و اللقب",
                onChanged: (value) {},
                icon: const Icon(PhosphorIcons.user, color: kPrimaryColor),
              ),
              RoundedInputField(
                icon: const Icon(PhosphorIcons.envelope_simple,
                    color: kPrimaryColor),
                hintText: "البريد الالكتروني",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "التسجيل",
                press: () {
                  Get.to(() => HomeView());
                },
              ),
              SizedBox(height: size.height * 0.03.h),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.to(() => const LoginView());
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
