import 'package:get/get.dart';
import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.put(
        ProfileController()); // auth controller for logout ( register login and home )
  }
}
