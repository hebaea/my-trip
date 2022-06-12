import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final profileFormKey = GlobalKey<FormState>();
  late Future<UserModel?> userModel;

  late TextEditingController nameController, emailController;

//auth controller
  var storage = const FlutterSecureStorage();
  var name = ''.obs;
  var email = ''.obs;
  var token = '';
  String? id = '';

  @override
  void onInit() async {
    name.value = (await storage.read(key: "name"))!;
    id = await storage.read(key: "id");

    authData();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    nameController = TextEditingController();

    nameController.text = name.value;
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  authData() async {
    name.value = (await storage.read(key: "name"))!;
    token = (await storage.read(key: "token"))!;
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

  doLogout() async {
    await storage.deleteAll();
    // Get.toNamed(Routes.LOGIN);
    Get.offAndToNamed(Routes.LOGIN);
  }

  updateProfileNameAndEmail() async {
    bool isValidate = profileFormKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      try {
        UserModel? data = await AuthServices.update(
          name: nameController.text,
          email: emailController.text,
          id: id,
        );
        if (data != null) {
          print("---------- data ----------------------");

          print(data.toString());
          await storage.write(key: "name", value: data.guestName);
          await storage.write(key: "email", value: data.guestEmail);
          profileFormKey.currentState!.save();
          print("storage------------------------------");
          String? name = await storage.read(key: "name");
          String? email = await storage.read(key: "email");

          print(email);
          print(name);
          // Get.toNamed(Routes.DASHBOARD);
          // Get.off(Routes.DASHBOARD);
          // Get.offAll(Routes.DASHBOARD);
          Get.snackbar("update profile", "successfully");
        } else {
          Get.snackbar("update profile", "problem in update profile");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
