import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/services/auth_services.dart';

class RegisterController extends GetxController {
  // final _name = '';
  // final _email = '';
  // final _password = '';
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passwordController;
  String name = '', email = '', password = '';

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "this is wrong email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "short password";
    } else {
      return null;
    }
  }

  doRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        var data = AuthServices.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
        if (data != null) {}
      } finally {
        isLoading(false);
      }
    }
  }

// @override
// void dispose() {
//   nameController.dispose();
//   emailController.dispose();
//   passwordController.dispose();
//   super.dispose();
// }

// createAccountPressed() async {
//   bool emailValid = RegExp(
//           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(_email);
//   if (emailValid) {
//     http.Response response =
//         await AuthServices.register(_name, _email, _password);
//     Map responseMap = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       Get.to(const DashboardView());
//     } else {
//       // errorSnackBar(context, responseMap.values.first[0]);
//       print(responseMap.values.first[0]);
//     }
//   } else {
//     // errorSnackBar(context, 'email not valid');
//     print('email not valid');
//   }
// }
}
