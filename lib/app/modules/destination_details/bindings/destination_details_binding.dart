import 'package:get/get.dart';
import 'package:my_trip/app/modules/appartment_reservation/controllers/appartment_reservation_controller.dart';
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
  }
}
