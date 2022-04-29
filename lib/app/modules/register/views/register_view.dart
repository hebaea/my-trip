import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/theme.dart';
import 'package:my_trip/app/global_widgets/primary_button.dart';

import '../controllers/register_controller.dart';
import '../widgets/body.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
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
