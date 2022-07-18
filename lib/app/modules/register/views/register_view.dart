import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/already_have_an_account_acheck.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/global_widgets/rounded_password_field.dart';
import 'package:my_trip/app/modules/register/widgets/background.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.registerFormKey,
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
                    hintText: "الاسم",
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("الإسم لا يمكن أن يكون فارغ");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("أدخل إسم صالح (علي الأقل 3 أحرف)");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.nameController.text = value!;
                    },

                    onChanged: (value) {},
                    icon: const Icon(PhosphorIcons.user,
                        color: AppThemeColors.primaryColor),
                    readOnly: false,
                    // controller: name,
                  ),
                  RoundedInputField(
                    icon: const Icon(PhosphorIcons.envelope_simple,
                        color: AppThemeColors.primaryColor),
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "البريد الالكتروني",
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
                    onSaved: (v) {
                      controller.emailController.text = v!;
                    },
                    onChanged: (value) {},
                    readOnly: false,
                  ),
                  Obx(
                    () => RoundedPasswordField(
                      onChanged: (value) {},
                      validator: (v) {
                        // return controller.validatePassword(v!);
                      },
                      onSaved: (v) {
                        controller.passwordController.text = v!;
                      },
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      onTap: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                  ),
                  RoundedButton(
                    text: "التسجيل",
                    press: () {
                      controller.doRegister();
                    },
                  ),
                  SizedBox(height: size.height * 0.03.h),
                  Obx(
                    () => controller.isLoading.value == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text(''),
                  ),
                  SizedBox(height: size.height * 0.03.h),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      // Get.toNamed(Routes.LOGIN);
                      Get.offAllNamed(Routes.LOGIN);
                    },
                  ),
                  SizedBox(height: size.height * 0.03.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
