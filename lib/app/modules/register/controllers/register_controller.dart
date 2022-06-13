import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  final registerFormKey = GlobalKey<FormState>();

  // GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
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

  // String? validateEmail(String value) {
  //   if (!GetUtils.isEmail(value)) {
  //     return "this is wrong email";
  //   } else {
  //     return null;
  //   }
  // }

  // String? validatePassword(String value) {
  //   if (value.length < 6) {
  //     return "short password";
  //   } else {
  //     return null;
  //   }
  // }

  doRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        UserModel? data = await AuthServices.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
        if (data != null) {
          print("---------- data ----------------------");

          print(data.toString());
          await storage.write(key: "name", value: data.guestName);
          await storage.write(key: "email", value: data.guestEmail);

          await storage.write(key: "token", value: data.token);
          await storage.write(key: "id", value: data.guestId.toString());
          registerFormKey.currentState!.save();
          print("------------------storage------------------------------");
          String? name = await storage.read(key: "name");
          print(name);
          Get.toNamed(Routes.DASHBOARD);
          // Get.off(Routes.DASHBOARD);
          // Get.offAll(Routes.DASHBOARD);
        } else {
          Get.snackbar("register", "problem in register");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
