import 'package:get/get.dart';

import '../controllers/appartment_reservation_controller.dart';

class ApartmentReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentReservationController>(
      () => ApartmentReservationController(),
    );
  }
}
