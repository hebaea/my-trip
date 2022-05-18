import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_trip/app/modules/dashboard/views/dashboard_view.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passwordController;
  String name = '', email = '', password = '';
  final storage = const FlutterSecureStorage();

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
        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          registerFormKey.currentState!.save();
          Get.to(const DashboardView()); // use routes!!!!!

        } else {
          Get.snackbar("register", "problem in register");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
