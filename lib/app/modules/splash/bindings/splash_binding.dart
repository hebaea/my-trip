import 'package:get/get.dart';
import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
