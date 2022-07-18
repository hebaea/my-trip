import 'package:get/get.dart';

import '../controllers/chalet_reservation_details_controller.dart';

class ChaletReservationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChaletReservationDetailsController>(
      () => ChaletReservationDetailsController(),
    );
  }
}
