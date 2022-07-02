import 'package:get/get.dart';

import '../controllers/chalets_reservation_controller.dart';

class ChaletsReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChaletsReservationController>(
      () => ChaletsReservationController(),
    );
  }
}
