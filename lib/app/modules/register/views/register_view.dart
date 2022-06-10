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
import 'package:my_trip/app/modules/login/views/login_view.dart';
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    hintText: "الاسم و اللقب",
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
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

                    onChanged: (value) {},
                    icon: const Icon(PhosphorIcons.user,
                        color: AppThemeColors.primaryColor),
                    // controller: name,
                  ),
                  RoundedInputField(
                    icon: const Icon(PhosphorIcons.envelope_simple,
                        color: AppThemeColors.primaryColor),
                    controller: controller.emailController,
                    hintText: "البريد الالكتروني",
                    validator: (value) {
                      // return controller.validateEmail(v!);
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (v) {
                      controller.email = v!;
                    },
                    onChanged: (value) {},
                  ),
                  Obx(
                    () => RoundedPasswordField(
                      onChanged: (value) {},
                      validator: (v) {
                        // return controller.validatePassword(v!);
                      },
                      onSaved: (v) {
                        controller.password = v!;
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
//
// return Scaffold(
// resizeToAvoidBottomInset: false,
// backgroundColor: Colors.white,
// body: SingleChildScrollView(
// child: SafeArea(
// child: Padding(
// padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Register new\naccount',
// style: heading2.copyWith(color: textBlack),
// ),
// SizedBox(
// height: 20,
// ),
// Image.asset(
// 'assets/images/accent.png',
// width: 99,
// height: 4,
// ),
// ],
// ),
// SizedBox(
// height: 48,
// ),
// Form(
// child: Column(
// children: [
// Container(
// decoration: BoxDecoration(
// color: textWhiteGrey,
// borderRadius: BorderRadius.circular(14.0),
// ),
// child: TextFormField(
// decoration: InputDecoration(
// hintText: 'Email',
// hintStyle: heading6.copyWith(color: textGrey),
// border: OutlineInputBorder(
// borderSide: BorderSide.none,
// ),
// ),
// ),
// ),
// SizedBox(
// height: 32,
// ),
// Container(
// decoration: BoxDecoration(
// color: textWhiteGrey,
// borderRadius: BorderRadius.circular(14.0),
// ),
// child: TextFormField(
// // obscureText: !passwordVisible,
// decoration: InputDecoration(
// hintText: 'Password',
// hintStyle: heading6.copyWith(color: textGrey),
// suffixIcon: IconButton(
// color: textGrey,
// splashRadius: 1,
// icon: Icon(Icons.add
// // passwordVisible
// // ? Icons.visibility_outlined
// // : Icons.visibility_off_outlined
// ),
// onPressed: () {}
// // togglePassword,
// ),
// border: OutlineInputBorder(
// borderSide: BorderSide.none,
// ),
// ),
// ),
// ),
// SizedBox(
// height: 32,
// ),
// Container(
// decoration: BoxDecoration(
// color: textWhiteGrey,
// borderRadius: BorderRadius.circular(14.0),
// ),
// child: TextFormField(
// // obscureText: !passwordConfrimationVisible,
// decoration: InputDecoration(
// hintText: 'Password Confirmation',
// hintStyle: heading6.copyWith(color: textGrey),
// suffixIcon: IconButton(
// color: textGrey,
// splashRadius: 1,
// icon: Icon(Icons.visibility_off_outlined),
// onPressed: () {},
// ),
// border: OutlineInputBorder(
// borderSide: BorderSide.none,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// SizedBox(
// height: 32,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(
// width: 12,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'By creating an account, you agree to our',
// style: regular16pt.copyWith(color: textGrey),
// ),
// Text(
// 'Terms & Conditions',
// style: regular16pt.copyWith(color: primaryBlue),
// ),
// ],
// ),
// ],
// ),
// SizedBox(
// height: 32,
// ),
// CustomPrimaryButton(
// buttonColor: primaryBlue,
// textValue: 'Register',
// textColor: Colors.white,
// ),
// SizedBox(
// height: 50,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Already have an account? ",
// style: regular16pt.copyWith(color: textGrey),
// ),
// GestureDetector(
// onTap: () {
// Navigator.pop(
// context,
// );
// },
// child: Text(
// 'Login',
// style: regular16pt.copyWith(color: primaryBlue),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// );

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterapp/Services/auth_services.dart';
// import 'package:flutterapp/Services/globals.dart';
//
// import '../rounded_button.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
// import 'package:http/http.dart' as http;
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   String _email = '';
//   String _password = '';
//   String _name = '';
//
//   createAccountPressed() async {
//     bool emailValid = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(_email);
//     if (emailValid) {
//       http.Response response =
//       await AuthServices.register(_name, _email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => const HomeScreen(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first[0]);
//       }
//     } else {
//       errorSnackBar(context, 'email not valid');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         elevation: 0,
//         title: const Text(
//           'Registration',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Name',
//               ),
//               onChanged: (value) {
//                 _name = value;
//               },
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Email',
//               ),
//               onChanged: (value) {
//                 _email = value;
//               },
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             TextField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                 hintText: 'Password',
//               ),
//               onChanged: (value) {
//                 _password = value;
//               },
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             RoundedButton(
//               btnText: 'Create Account',
//               onBtnPressed: () => createAccountPressed(),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (BuildContext context) => const LoginScreen(),
//                     ));
//               },
//               child: const Text(
//                 'already have an account',
//                 style: TextStyle(
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
