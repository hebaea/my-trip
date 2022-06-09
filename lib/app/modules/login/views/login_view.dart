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
import 'package:my_trip/app/modules/login/widgets/background.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.03.h),
                  const DefaultText("تسجيل الدخول",
                      fontWeight: FontWeight.bold),
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
                    controller: controller.emailController,
                    validator: (v) {
                      return controller.validateEmail(v!);
                    },
                    onSaved: (v) {},
                    icon: const Icon(PhosphorIcons.envelope_simple,
                        color: AppThemeColors.primaryColor),
                  ),
                  Obx(
                    () => RoundedPasswordField(
                      controller: controller.passwordController,
                      onChanged: (value) {},
                      obscureText: controller.isPasswordHidden.value,
                      onTap: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                  ),
                  RoundedButton(
                    text: "تسجيل الدخول",
                    press: () {
                      controller.doLogin();
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
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Get.toNamed(Routes.REGISTER);
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

// return Scaffold(
//   resizeToAvoidBottomInset: false,
//   backgroundColor: Colors.white,
//   body: SafeArea(
//     child: Padding(
//       padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Login to your\naccount',
//                 style: heading2.copyWith(color: textBlack),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Image.asset(
//                 'assets/images/accent.png',
//                 width: 99,
//                 height: 4,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 48,
//           ),
//           Form(
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: textWhiteGrey,
//                     borderRadius: BorderRadius.circular(14.0),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       hintStyle: heading6.copyWith(color: textGrey),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 32,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: textWhiteGrey,
//                     borderRadius: BorderRadius.circular(14.0),
//                   ),
//                   child: TextFormField(
//                     // obscureText: !passwordVisible,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       hintStyle: heading6.copyWith(color: textGrey),
//                       // suffixIcon: IconButton(
//                       //   color: textGrey,
//                       //   splashRadius: 1,
//                       //   icon: Icon(passwordVisible
//                       //       ? Icons.visibility_outlined
//                       //       : Icons.visibility_off_outlined),
//                       //   onPressed: togglePassword,
//                       // ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 32,
//           ),
//           CustomPrimaryButton(
//             buttonColor: primaryBlue,
//             textValue: 'Login',
//             textColor: Colors.white,
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           Center(
//             child: Text(
//               'OR',
//               style: heading6.copyWith(color: textGrey),
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           CustomPrimaryButton(
//             buttonColor: Color(0xfffbfbfb),
//             textValue: 'Login with Google',
//             textColor: textBlack,
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Don't have an account? ",
//                 style: regular16pt.copyWith(color: textGrey),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(RegisterView());
//                 },
//                 child: Text(
//                   'Register',
//                   style: regular16pt.copyWith(color: primaryBlue),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// );
////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutterapp/Services/auth_services.dart';
// import 'package:flutterapp/Services/globals.dart';
// import 'package:flutterapp/rounded_button.dart';
// import 'package:http/http.dart' as http;
//
// import 'home_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   String _email = '';
//   String _password = '';
//
//   loginPressed() async {
//     if (_email.isNotEmpty && _password.isNotEmpty) {
//       http.Response response = await AuthServices.login(_email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => const HomeScreen(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first);
//       }
//     } else {
//       errorSnackBar(context, 'enter all required fields');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           elevation: 0,
//           title: const Text(
//             'Login',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your email',
//                 ),
//                 onChanged: (value) {
//                   _email = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your password',
//                 ),
//                 onChanged: (value) {
//                   _password = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               RoundedButton(
//                 btnText: 'LOG IN',
//                 onBtnPressed: () => loginPressed(),
//               )
//             ],
//           ),
//         ));
//   }
// }
