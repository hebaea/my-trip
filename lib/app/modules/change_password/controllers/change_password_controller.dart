import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  final passwordFormKey = GlobalKey<FormState>();
  late Future<UserModel?> userModel;
  var storage = const FlutterSecureStorage();

  late TextEditingController passwordController;
  var password = '';
  String? id = '';

  @override
  void onInit() {
    passwordController = TextEditingController();
    getId();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passwordController.dispose();
  }

  updatePassword() async {
    bool isValidate = passwordFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        UserModel? data = await AuthServices.updatePassword(
          password: passwordController.text,
          id: id,
        );
        if (data != null) {
          print("---------- data ----password------------------");

          print(data.toString());
          // Get.toNamed(Routes.DASHBOARD);
          // Get.off(Routes.DASHBOARD);
          // Get.offAll(Routes.DASHBOARD);
          Get.snackbar("update password", "successfully");
        } else {
          Get.snackbar("update password", "problem in update password");
        }
      } finally {
        isLoading(false);
      }
    }
  }

  getId() async {
    id = await storage.read(key: "id");
  }
}
