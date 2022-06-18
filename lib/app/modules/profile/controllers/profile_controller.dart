import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final profileFormKey = GlobalKey<FormState>();
  late Future<UserModel?> userModel;

  late TextEditingController nameController, emailController;

//auth controller
//   var storage = const FlutterSecureStorage();
  final storage = GetStorage();
  var name = ''.obs;
  var email = ''.obs;
  var token = '';
  String? id = '';

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    getNameAndEmail();
    authData();
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
    super.dispose();
  }

  authData() async {
    name.value = (await storage.read("name"))!;
    token = (await storage.read("token"))!;
  }

  bool isAuth() {
    print(token);
    return token.isNotEmpty;
  }

  doLogout() async {
    // storage.delete(key: key);
    // await storage.deleteAll();
    // Get.toNamed(Routes.LOGIN);
    await storage.remove("token");
    Get.offAndToNamed(Routes.LOGIN);
  }

  getNameAndEmail() async {
    name.value = (await storage.read("name"))!;
    email.value = (await storage.read("email"))!;

    id = await storage.read("id");
    nameController.text = name.value;
    emailController.text = email.value;
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
          await storage.write("name", data.guestName);
          await storage.write("email", data.guestEmail);
          profileFormKey.currentState!.save();
          print("storage------------------------------");
          String? name = await storage.read("name");
          String? email = await storage.read("email");

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
