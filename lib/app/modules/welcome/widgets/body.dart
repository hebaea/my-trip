import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/login/views/login_view.dart';
import 'package:my_trip/app/modules/register/views/register_view.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              "مرحبا بك في رحلتي",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/images/choice.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "تسجيل الدخول",
              press: () {
                Get.to(()=>LoginView());
              },
            ),
            RoundedButton(
              text: "تسجيل حساب جديد",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Get.to(()=>RegisterView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
