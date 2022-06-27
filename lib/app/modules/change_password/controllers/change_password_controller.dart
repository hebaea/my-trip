import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/data/services/auth_services.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  final passwordFormKey = GlobalKey<FormState>();
  late Future<UserModel?> userModel;

  TextEditingController passwordController = TextEditingController();

  final storage = GetStorage();

  var password = ''.obs;
  String? id = '';

  @override
  void onInit() {
    getId();

    super.onInit();
  }

  getId() async {
    id = storage.read("id").toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  updatePassword() async {
    isLoading(true);
    try {
      await AuthServices.updatePassword(
        password: passwordController.text,
        id: id,
      );
    } finally {
      isLoading(false);
    }
  }
}
