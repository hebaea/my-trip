import 'package:get/get.dart';

import '../controllers/hotel_reservation_details_controller.dart';

class HotelReservationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelReservationDetailsController>(
      () => HotelReservationDetailsController(),
    );
  }
}
