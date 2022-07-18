import 'package:get/get.dart';

import '../controllers/apartment_reservation_details_controller.dart';

class ApartmentReservationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentReservationDetailsController>(
      () => ApartmentReservationDetailsController(),
    );
  }
}
