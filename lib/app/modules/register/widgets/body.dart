import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/already_have_an_account_acheck.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/global_widgets/rounded_password_field.dart';
import 'package:my_trip/app/modules/login/views/login_view.dart';
import 'package:my_trip/app/modules/register/widgets/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "تسجيل حساب جديد",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/images/register.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "الاسم و اللقب",
              onChanged: (value) {}, icon: const Icon(PhosphorIcons.user, color: kPrimaryColor),
            ),
            RoundedInputField(
              icon: const Icon(PhosphorIcons.envelope_simple, color: kPrimaryColor),
              hintText: "البريد الالكتروني",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "التسجيل",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.to(LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
