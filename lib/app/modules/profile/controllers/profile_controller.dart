import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class ProfileController extends GetxController {
//auth controller
  var storage = const FlutterSecureStorage();
  var name = ''.obs;
  var token = '';

  @override
  void onInit() {
    authData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  authData() async {
    name.value = (await storage.read(key: "name"))!;
    token = (await storage.read(key: "token"))!;
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

  doLogout() async {
    await storage.deleteAll();
    Get.to(Routes.LOGIN);
  }
}
