import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/data/services/auth_services.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final profileFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final storage = GetStorage();
  var name = ''.obs;
  var email = ''.obs;
  var token = '';
  String? id = '';

  @override
  void onInit() {
    getNameAndEmail();
    authData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  authData() async {
    name.value = await storage.read("name");
    token = await storage.read("token");
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

  doLogout() async {
    await storage.erase();
    Get.offAndToNamed(Routes.LOGIN);
  }

  getNameAndEmail() async {
    name.value = await storage.read("name");
    email.value = await storage.read("email");

    id = storage.read("id").toString();
    nameController.text = name.value;
    emailController.text = email.value;
  }

  updateProfileNameAndEmail() async {
    isLoading(true);
    try {
      await AuthServices.update(
        name: nameController.text,
        email: emailController.text,
        id: id,
      );
      await storage.write("name", nameController.text);
      await storage.write("email", emailController.text);
    } finally {
      isLoading(false);
    }
  }
}
