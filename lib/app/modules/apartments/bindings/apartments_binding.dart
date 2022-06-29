import 'package:get/get.dart';

import '../controllers/apartments_controller.dart';

class ApartmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentsController>(
      () => ApartmentsController(),
    );
  }
}
