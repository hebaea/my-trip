import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/utils/custom_snackbar.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  final loginFormKey = GlobalKey<FormState>();

  final storage = GetStorage();

  @override
  void onInit() {
    checkUser();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  checkUser() async {
    var token = storage.read("token");
    if (token != null) {
      Get.offAllNamed(Routes.DASHBOARD);
    }
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

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        UserModel? data = await AuthServices.login(
            email: emailController.text, password: passwordController.text);
        if (data != null) {
          print("---------- data ----------------------");

          print(data.toString());

          await storage.write("name", data.guestName);
          await storage.write("token", data.token);
          await storage.write("email", data.guestEmail);
          await storage.write("id", data.guestId);

          // loginFormKey.currentState!.save();
          print("storage------------------------------");
          String? name = await storage.read("name");
          print(name);
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          // customSnackbar("تسجيل الدخول", "مشكلة في تسجيل الدخول", "error");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
