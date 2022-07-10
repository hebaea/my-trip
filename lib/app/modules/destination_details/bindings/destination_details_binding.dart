import 'package:get/get.dart';
import 'package:my_trip/app/modules/appartment_reservation/controllers/appartment_reservation_controller.dart';
import 'package:my_trip/app/modules/chalets_reservation/controllers/chalets_reservation_controller.dart';
import 'package:my_trip/app/modules/hotel_reservation/controllers/hotel_reservation_controller.dart';
import '../controllers/destination_details_controller.dart';

class DestinationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationDetailsController>(
        () => DestinationDetailsController(),
        fenix: true);
    Get.lazyPut<ApartmentReservationController>(
      () => ApartmentReservationController(),
    );
    Get.lazyPut<HotelReservationController>(
      () => HotelReservationController(),
    );
    Get.lazyPut<ChaletsReservationController>(
      () => ChaletsReservationController(),
    );
  }
}
