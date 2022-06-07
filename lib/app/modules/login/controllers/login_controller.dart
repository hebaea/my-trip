import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/modules/dashboard/views/dashboard_view.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = '', password = '';
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
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

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        var data = AuthServices.login(
            email: emailController.text, password: passwordController.text);
        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          loginFormKey.currentState!.save();
          Get.toNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar("login", "problem in login");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
