import 'package:get/get.dart';

import '../controllers/appartment_reservation_controller.dart';

class AppartmentReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppartmentReservationController>(
      () => AppartmentReservationController(),
    );
  }
}
