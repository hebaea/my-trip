import 'package:get/get.dart';
import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.put(ProfileController()); // auth controller for logout ( register login and home )
  }
}
